#!/bin/bash

# FModCLI Installation Script
# Automatically builds and installs FModCLI

set -e  # Exit on any error

echo "🤖 FModCLI Installation Script"
echo "=============================="

# Check if we're on macOS
if [[ "$OSTYPE" != "darwin"* ]]; then
    echo "❌ This tool requires macOS with Apple Intelligence support"
    exit 1
fi

# Check macOS version (need 15.0+ which reports as Darwin 24.0+)
DARWIN_VERSION=$(uname -r | cut -d. -f1)
if [ "$DARWIN_VERSION" -lt 24 ]; then
    echo "⚠️  Warning: This tool requires macOS 15.0+ for Apple Intelligence support"
    echo "   Your system may not have full functionality"
fi

# Check if Swift is installed
if ! command -v swift &> /dev/null; then
    echo "❌ Swift is required but not installed"
    echo "   Please install Xcode or Swift toolchain first"
    exit 1
fi

echo "✅ Prerequisites check passed"

# Build the project
echo ""
echo "🔨 Building FModCLI..."
if swift build -c release; then
    echo "✅ Build successful"
else
    echo "❌ Build failed"
    exit 1
fi

# Check if binary exists
if [ ! -f ".build/release/fmodcli" ]; then
    echo "❌ Binary not found at .build/release/fmodcli"
    exit 1
fi

# Test the binary
echo ""
echo "🧪 Testing binary..."
if ./.build/release/fmodcli --version &> /dev/null; then
    echo "✅ Binary test passed"
else
    echo "❌ Binary test failed"
    exit 1
fi

# Ask user for installation preference
echo ""
echo "📦 Choose installation option:"
echo "1) System-wide installation (requires sudo)"
echo "2) User-local installation (~/.local/bin)"
echo "3) Skip installation (just build)"
echo ""
read -p "Enter choice [1-3]: " choice

case $choice in
    1)
        echo ""
        echo "🔐 Installing system-wide (requires admin password)..."
        if sudo cp .build/release/fmodcli /usr/local/bin/ && sudo chmod +x /usr/local/bin/fmodcli; then
            echo "✅ System-wide installation successful"
            echo ""
            echo "🎉 FModCLI is now installed! Try:"
            echo "   fmodcli --version"
            echo "   fmodcli \"Hello from Apple Intelligence!\""
        else
            echo "❌ System-wide installation failed"
            exit 1
        fi
        ;;
    2)
        echo ""
        echo "👤 Installing to user directory..."
        mkdir -p ~/.local/bin
        if cp .build/release/fmodcli ~/.local/bin/; then
            echo "✅ User-local installation successful"
            
            # Check if ~/.local/bin is in PATH
            if [[ ":$PATH:" != *":$HOME/.local/bin:"* ]]; then
                echo ""
                echo "⚠️  ~/.local/bin is not in your PATH"
                echo "   Add this to your shell profile (~/.zshrc or ~/.bash_profile):"
                echo "   export PATH=\"\$HOME/.local/bin:\$PATH\""
                echo ""
                read -p "Add to ~/.zshrc automatically? [y/N]: " add_path
                if [[ $add_path =~ ^[Yy]$ ]]; then
                    echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.zshrc
                    echo "✅ Added to ~/.zshrc"
                    echo "   Run 'source ~/.zshrc' or restart your terminal"
                fi
            fi
            
            echo ""
            echo "🎉 FModCLI is installed! Try:"
            echo "   ~/.local/bin/fmodcli --version"
            echo "   Or add ~/.local/bin to PATH and use: fmodcli --version"
        else
            echo "❌ User-local installation failed"
            exit 1
        fi
        ;;
    3)
        echo ""
        echo "✅ Build complete! Binary available at:"
        echo "   $(pwd)/.build/release/fmodcli"
        echo ""
        echo "🎉 Try it:"
        echo "   ./.build/release/fmodcli --version"
        echo "   ./.build/release/fmodcli \"Hello from Apple Intelligence!\""
        ;;
    *)
        echo "❌ Invalid choice"
        exit 1
        ;;
esac

echo ""
echo "🚀 Installation complete!"
echo ""
echo "📖 For more examples and usage:"
echo "   https://github.com/Gabrielmcp78/FModCLI"