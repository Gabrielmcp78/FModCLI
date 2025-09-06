#!/bin/bash

# Batch Processing Examples for FModCLI
# Demonstrates automation and workflow integration

echo "⚡ FModCLI Batch Processing Examples"
echo "===================================="

# Function to check if FModCLI is available
check_fmodcli() {
    if ! command -v fmodcli &> /dev/null; then
        echo "❌ fmodcli not found. Please install FModCLI first."
        exit 1
    fi
}

check_fmodcli

# Create output directory
mkdir -p batch_output
echo "📁 Created batch_output directory"

# Example 1: Process multiple programming languages
echo "🔹 Example 1: Batch processing programming languages"
languages=("Python" "JavaScript" "Swift" "Rust" "Go")

echo "Processing ${#languages[@]} programming languages..."
for lang in "${languages[@]}"; do
    echo "  📝 Processing: $lang"
    fmodcli --output json "Describe the key features and use cases of $lang programming language" \
        > "batch_output/${lang,,}_overview.json"
    
    # Extract just the text content for a summary file
    if command -v jq &> /dev/null; then
        jq -r '.result' "batch_output/${lang,,}_overview.json" > "batch_output/${lang,,}_summary.txt"
    fi
done
echo "✅ Language processing completed"
echo

# Example 2: Generate documentation for API endpoints
echo "🔹 Example 2: API documentation generation"
endpoints=("GET /users" "POST /users" "PUT /users/{id}" "DELETE /users/{id}")

echo "Generating documentation for ${#endpoints[@]} API endpoints..."
for endpoint in "${endpoints[@]}"; do
    safe_name=$(echo "$endpoint" | tr '/' '_' | tr ' ' '_' | tr '{' '' | tr '}' '')
    echo "  📚 Documenting: $endpoint"
    fmodcli "Write comprehensive API documentation for endpoint: $endpoint. Include description, parameters, request/response examples, and error codes." \
        > "batch_output/api_${safe_name}.md"
done
echo "✅ API documentation completed"
echo

# Example 3: Code review checklist generation
echo "🔹 Example 3: Code review checklists"
code_types=("Frontend React" "Backend Node.js" "Mobile Swift" "Database SQL")

echo "Creating code review checklists..."
for code_type in "${code_types[@]}"; do
    safe_name=$(echo "$code_type" | tr ' ' '_' | tr '[:upper:]' '[:lower:]')
    echo "  ✅ Creating checklist for: $code_type"
    fmodcli "Create a comprehensive code review checklist for $code_type development. Include security, performance, maintainability, and best practices." \
        > "batch_output/checklist_${safe_name}.md"
done
echo "✅ Checklist generation completed"
echo

# Example 4: Parallel processing (if available)
echo "🔹 Example 4: Parallel processing demonstration"
if command -v parallel &> /dev/null; then
    echo "Using GNU parallel for faster processing..."
    
    # Create a list of prompts
    cat > batch_output/prompts.txt << 'EOF'
Explain design patterns in software development
Describe the principles of clean code
What are the benefits of test-driven development
How to implement CI/CD pipelines
Best practices for database optimization
EOF
    
    # Process in parallel
    parallel -j 3 --colsep '\t' 'echo "Processing: {1}" && fmodcli --output json "{1}" > "batch_output/parallel_{#}.json"' :::: batch_output/prompts.txt
    
    echo "✅ Parallel processing completed"
else
    echo "ℹ️  GNU parallel not available. Install with: brew install parallel"
    echo "   Processing sequentially instead..."
    
    prompts=(
        "Explain design patterns in software development"
        "Describe the principles of clean code"
        "What are the benefits of test-driven development"
        "How to implement CI/CD pipelines"
        "Best practices for database optimization"
    )
    
    for i in "${!prompts[@]}"; do
        echo "  📝 Processing prompt $((i+1))/${#prompts[@]}"
        fmodcli --output json "${prompts[$i]}" > "batch_output/sequential_$((i+1)).json"
    done
    echo "✅ Sequential processing completed"
fi
echo

# Example 5: Generate project documentation
echo "🔹 Example 5: Project documentation suite"
doc_types=(
    "README:Write a comprehensive README.md template for an open-source project"
    "CONTRIBUTING:Create a CONTRIBUTING.md guide for open-source contributors"
    "CODE_OF_CONDUCT:Generate a professional code of conduct for a tech community"
    "SECURITY:Write a SECURITY.md policy for vulnerability reporting"
)

echo "Generating project documentation..."
for doc in "${doc_types[@]}"; do
    IFS=':' read -r filename prompt <<< "$doc"
    echo "  📄 Creating: ${filename}.md"
    fmodcli "$prompt" > "batch_output/${filename}.md"
done
echo "✅ Documentation suite completed"
echo

# Example 6: Data processing workflow
echo "🔹 Example 6: Data processing workflow"
echo "Creating a complete data analysis workflow..."

# Step 1: Generate sample data description
fmodcli --output json "Describe a sample e-commerce dataset with columns for user demographics, purchase history, and product categories" \
    > batch_output/dataset_description.json

# Step 2: Generate analysis questions
fmodcli "Based on an e-commerce dataset, list 10 important business questions that data analysis could answer" \
    > batch_output/analysis_questions.txt

# Step 3: Generate SQL queries
fmodcli "Write SQL queries to analyze customer behavior in an e-commerce database. Include queries for customer segmentation, sales trends, and product performance" \
    > batch_output/analysis_queries.sql

# Step 4: Generate Python analysis script
fmodcli "Write a Python script using pandas to analyze e-commerce data. Include data loading, cleaning, visualization, and insights generation" \
    > batch_output/analysis_script.py

echo "✅ Data workflow completed"
echo

# Summary and cleanup options
echo "📊 Batch Processing Summary"
echo "=========================="
echo "Files created in batch_output/:"
ls -la batch_output/ | wc -l | xargs echo "Total files:"
du -sh batch_output/ | cut -f1 | xargs echo "Total size:"
echo

echo "🧹 Cleanup Options:"
echo "  View all files: ls -la batch_output/"
echo "  Clean up: rm -rf batch_output/"
echo "  Archive: tar -czf fmodcli_batch_$(date +%Y%m%d_%H%M%S).tar.gz batch_output/"
echo

# Optional: Create archive
read -p "📦 Create archive of results? (y/N): " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    archive_name="fmodcli_batch_$(date +%Y%m%d_%H%M%S).tar.gz"
    tar -czf "$archive_name" batch_output/
    echo "✅ Archive created: $archive_name"
fi

echo "🎉 Batch processing examples completed!"
echo "💡 Tip: Combine FModCLI with tools like jq, parallel, and awk for powerful workflows"
