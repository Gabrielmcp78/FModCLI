# Examples Gallery

## Basic Usage

### Simple Text Generation

```bash
# Generate creative content
fmodcli "Write a haiku about artificial intelligence"

# Technical explanations
fmodcli "Explain how neural networks work in simple terms"

# Professional communication
fmodcli "Draft a follow-up email for a client meeting"
```

### Structured Output

```bash
# Get JSON responses for programmatic use
fmodcli --output json "List the top 5 programming languages for beginners"

# API-friendly format
fmodcli --output json "Summarize the main features of Swift programming language"
```

## Creative Writing

### Story Generation

```bash
# Short stories
fmodcli "Write a 200-word science fiction story about time travel"

# Character development
fmodcli "Create a detailed character profile for a fantasy novel protagonist"

# Plot outlines
fmodcli "Generate a compelling plot outline for a mystery novel"
```

### Poetry and Creative Content

```bash
# Poetry
fmodcli "Write a sonnet about the beauty of code"

# Song lyrics
fmodcli "Create uplifting song lyrics about overcoming challenges"

# Creative descriptions
fmodcli "Describe a futuristic cityscape in vivid detail"
```

## Technical Documentation

### Code Documentation

```bash
# API documentation
fmodcli "Write comprehensive documentation for a REST API endpoint that creates user accounts"

# Code comments
fmodcli "Generate clear comments for a complex sorting algorithm"

# README files
fmodcli "Create a professional README for an open-source JavaScript library"
```

### Technical Explanations

```bash
# Beginner-friendly explanations
fmodcli "Explain containerization and Docker to someone new to development"

# Advanced concepts
fmodcli "Describe the differences between SQL and NoSQL databases with examples"

# Best practices
fmodcli "List security best practices for web application development"
```

## Business and Professional

### Marketing Content

```bash
# Product descriptions
fmodcli "Write a compelling product description for a smart home security system"

# Blog posts
fmodcli "Create an engaging blog post intro about the future of remote work"

# Social media
fmodcli "Generate social media captions for a tech startup launch"
```

### Business Communication

```bash
# Proposals
fmodcli "Draft a project proposal for implementing AI in customer service"

# Reports
fmodcli "Create an executive summary for quarterly performance metrics"

# Presentations
fmodcli "Generate talking points for a presentation on digital transformation"
```

## Educational Content

### Learning Materials

```bash
# Study guides
fmodcli "Create a study guide for JavaScript fundamentals"

# Lesson plans
fmodcli "Design a lesson plan for teaching version control with Git"

# Explanations
fmodcli "Explain the concept of Big O notation with practical examples"
```

### Q&A and Tutorials

```bash
# FAQ generation
fmodcli "Generate frequently asked questions about machine learning"

# Step-by-step guides
fmodcli "Create a step-by-step guide for setting up a development environment"

# Troubleshooting
fmodcli "List common programming errors and how to fix them"
```

## Data Analysis and Insights

### JSON Output for Processing

```bash
# Structured analysis
fmodcli --output json "Analyze the pros and cons of microservices architecture"

# Categorized information
fmodcli --output json "Categorize programming languages by use case and difficulty"

# Comparative analysis
fmodcli --output json "Compare cloud providers AWS, Azure, and GCP across key features"
```

Example JSON response:
```json
{
  "prompt": "Compare cloud providers AWS, Azure, and GCP across key features",
  "result": {
    "aws": {
      "strengths": ["Market leader", "Extensive services", "Strong enterprise support"],
      "pricing": "Pay-as-you-go with various pricing models",
      "best_for": "Large enterprises and complex deployments"
    },
    "azure": {
      "strengths": ["Microsoft integration", "Hybrid cloud", "Enterprise features"],
      "pricing": "Competitive with strong enterprise discounts",
      "best_for": "Microsoft-centric organizations"
    },
    "gcp": {
      "strengths": ["Data analytics", "Machine learning", "Developer tools"],
      "pricing": "Competitive with sustained use discounts",
      "best_for": "Data-driven applications and startups"
    }
  },
  "model": "SystemLanguageModel",
  "timestamp": "2025-01-20T10:30:00Z"
}
```

## Shell Integration

### Bash Scripts

```bash
#!/bin/bash
# Generate commit messages
generate_commit_message() {
    local changes=$(git diff --staged --name-only)
    fmodcli "Generate a concise Git commit message for these file changes: $changes"
}

# Code review helper
review_code() {
    local file=$1
    local content=$(cat "$file")
    fmodcli "Review this code for potential improvements and best practices: $content"
}
```

### Automation Examples

```bash
# Daily standup generator
fmodcli "Generate 3 daily standup talking points for a software developer"

# Meeting agenda creator
fmodcli "Create a meeting agenda for a product planning session"

# Email templates
fmodcli "Write a professional out-of-office email template"
```

## Advanced Workflows

### Content Pipeline

```bash
# Multi-step content creation
# 1. Generate outline
outline=$(fmodcli --output json "Create a blog post outline about AI ethics")

# 2. Extract sections from JSON and expand each
echo "$outline" | jq -r '.sections[]' | while read section; do
    fmodcli "Write a detailed paragraph about: $section"
done
```

### Batch Processing

```bash
# Process multiple prompts
prompts=("Explain REST APIs" "Describe GraphQL" "Compare REST vs GraphQL")

for prompt in "${prompts[@]}"; do
    echo "Processing: $prompt"
    fmodcli --output json "$prompt" > "output_$(echo $prompt | tr ' ' '_').json"
done
```

### Data Processing

```bash
# Extract insights from data descriptions
data_description="Our e-commerce site has 10,000 daily visitors, 2% conversion rate"
insights=$(fmodcli --output json "Analyze this e-commerce data and suggest improvements: $data_description")

echo "$insights" | jq -r '.recommendations[]'
```

## Integration with Other Tools

### With jq (JSON processing)

```bash
# Extract specific fields
fmodcli --output json "List programming paradigms" | jq -r '.paradigms[]'

# Format output
fmodcli --output json "Compare databases" | jq '.comparison | to_entries[] | "\(.key): \(.value.main_use)"'
```

### With curl (API integration)

```bash
# Generate API test data
test_data=$(fmodcli --output json "Generate test user data for API testing")
curl -X POST -H "Content-Type: application/json" -d "$test_data" http://api.example.com/users
```

### With git (Development workflow)

```bash
# Generate PR descriptions
changes=$(git log --oneline main..HEAD)
fmodcli "Write a pull request description for these changes: $changes"

# Code documentation
files=$(git diff --name-only HEAD~1)
for file in $files; do
    fmodcli "Generate documentation for the changes in: $file"
done
```

## Error Handling Examples

```bash
# Robust script with error handling
generate_content() {
    local prompt="$1"
    local output_file="$2"
    
    if result=$(fmodcli --output json "$prompt" 2>/dev/null); then
        echo "$result" | jq -r '.result' > "$output_file"
        echo "✅ Content generated successfully"
    else
        echo "❌ Failed to generate content. Check Apple Intelligence availability."
        return 1
    fi
}

# Usage
generate_content "Write a README introduction" "readme_intro.txt"
```

## Performance Tips

1. **Batch Similar Requests**: Group similar prompts together
2. **Use JSON Output**: More efficient for programmatic processing
3. **Optimize Prompts**: Clear, specific prompts yield better results
4. **Cache Results**: Store frequently used responses
5. **Handle Errors**: Always include error handling in scripts

## Best Practices

1. **Prompt Engineering**: Be specific about desired output format
2. **Context Management**: Include relevant context in prompts
3. **Output Validation**: Verify JSON structure when using programmatically
4. **Privacy Awareness**: All processing is local - no data leaves your device
5. **Version Control**: Track prompt templates and configurations
