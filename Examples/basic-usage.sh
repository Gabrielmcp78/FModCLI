#!/bin/bash

# Basic Usage Examples for FModCLI
# This script demonstrates fundamental usage patterns

echo "🚀 FModCLI Basic Usage Examples"
echo "================================"

# Check if fmodcli is available
if ! command -v fmodcli &> /dev/null; then
    echo "❌ fmodcli not found. Please install FModCLI first."
    echo "See: https://github.com/yourusername/FModCLI#installation"
    exit 1
fi

echo "✅ FModCLI found. Running examples..."
echo

# Example 1: Simple text generation
echo "📝 Example 1: Simple text generation"
echo "Command: fmodcli \"Write a haiku about coding\""
fmodcli "Write a haiku about coding"
echo

# Example 2: Technical explanation
echo "🔧 Example 2: Technical explanation"
echo "Command: fmodcli \"Explain REST APIs in one paragraph\""
fmodcli "Explain REST APIs in one paragraph"
echo

# Example 3: JSON output
echo "📊 Example 3: JSON output"
echo "Command: fmodcli --output json \"List 3 benefits of version control\""
fmodcli --output json "List 3 benefits of version control"
echo

# Example 4: Creative writing
echo "✨ Example 4: Creative writing"
echo "Command: fmodcli \"Write a product description for a smart coffee maker\""
fmodcli "Write a product description for a smart coffee maker"
echo

# Example 5: Help commands
echo "❓ Example 5: Getting help"
echo "Command: fmodcli --help"
fmodcli --help
echo

echo "🎉 Basic examples completed!"
echo "For more examples, run: fmodcli examples"
