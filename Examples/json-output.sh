🔹 Example 4: Save JSON to file"
echo "Command: fmodcli --output json \"Describe microservices architecture\" > microservices.json"
fmodcli --output json "Describe microservices architecture" > microservices.json
echo "✅ JSON response saved to microservices.json"
echo "File contents:"
if command -v jq &> /dev/null; then
    jq . microservices.json
else
    cat microservices.json
fi
echo

# Example 5: Processing JSON in a loop
echo "🔹 Example 5: Batch processing with JSON"
topics=("Machine Learning" "Blockchain" "Cloud Computing")

echo "Processing multiple topics..."
for topic in "${topics[@]}"; do
    echo "Processing: $topic"
    filename=$(echo "$topic" | tr ' ' '_' | tr '[:upper:]' '[:lower:]')
    fmodcli --output json "Explain $topic in 2 sentences" > "${filename}.json"
    echo "✅ Saved to ${filename}.json"
done
echo

# Example 6: Error handling
echo "🔹 Example 6: Error handling in scripts"
echo "Command with error handling:"
if response=$(fmodcli --output json "Explain quantum computing" 2>/dev/null); then
    echo "✅ Success:"
    pretty_json "$response"
else
    echo "❌ Error: Failed to generate response"
fi
echo

# Cleanup
echo "🧹 Cleaning up example files..."
rm -f microservices.json machine_learning.json blockchain.json cloud_computing.json
echo "✅ Cleanup completed"

echo "🎉 JSON examples completed!"
echo "💡 Tip: Install 'jq' for better JSON processing: brew install jq"
