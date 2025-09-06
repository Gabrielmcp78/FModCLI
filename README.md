# FModCLI 🤖

**Apple FoundationModels CLI - Professional Command-Line Interface for Apple Intelligence**

[![Swift 6.0](https://img.shields.io/badge/Swift-6.0-orange.svg)](https://swift.org)
[![macOS 26+](https://img.shields.io/badge/macOS-26+-blue.svg)](https://developer.apple.com/macos/)
[![Apple Intelligence](https://img.shields.io/badge/Apple-Intelligence-black.svg)](https://developer.apple.com/machine-learning/)
[![MIT License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

> **Unlock the power of Apple Intelligence from your terminal.** Professional, production-ready interface to Apple's on-device FoundationModels.

## 🚀 Installation & Quick Start

### Requirements
- **macOS 26.0+** (required for Apple Intelligence and FoundationModels framework)
- **Apple Intelligence compatible device** (M1/M2/M3 Macs recommended for optimal performance)
- **Swift 6.0+** (for building from source)

### Installation

#### Build from Source
```bash
git clone https://github.com/yourusername/FModCLI.git
cd FModCLI
swift build -c release
```

The compiled binary will be available at `.build/release/fmodcli`.

#### Install System-Wide (Recommended)

To use `fmodcli` from anywhere in your terminal:

```bash
# Copy to your PATH
sudo cp .build/release/fmodcli /usr/local/bin/

# Make it executable (if needed)
sudo chmod +x /usr/local/bin/fmodcli

# Test the installation
fmodcli --version
```

Now you can use `fmodcli` from any directory:

```bash
fmodcli "Hello, world!"
```

#### Alternative: User-Local Installation

If you don't have admin rights or prefer user-local installation:

```bash
# Create local bin directory (if it doesn't exist)
mkdir -p ~/.local/bin

# Copy binary to user bin
cp .build/release/fmodcli ~/.local/bin/

# Add to your shell profile (if not already in PATH)
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.zshrc
source ~/.zshrc

# Test the installation
fmodcli --version
```

#### Or Run Directly

If you prefer not to install at all:

```bash
./.build/release/fmodcli "Hello, world!"
```

### Basic Usage

Generate text using Apple Intelligence:
```bash
# Simple text generation
fmodcli "Write a haiku about technology"

# Structured JSON output
fmodcli --output json "Summarize the key principles of good API design"

# Creative writing
fmodcli "Create a short story about an AI that discovers poetry"
```

## ✨ Features

- **🧠 Apple Intelligence Integration** - Direct access to on-device FoundationModels
- **⚡ Zero-Latency Processing** - All computation happens locally on your Mac
- **🔒 Privacy-First** - Your data never leaves your device
- **📋 Multiple Output Formats** - Text, JSON, and structured responses
- **🛠️ Developer-Friendly** - Clean APIs and comprehensive documentation
- **🎯 Production Ready** - Professional error handling and robust architecture

## 📚 Examples

### Text Generation
```bash
# Creative writing
fmodcli "Write a compelling product description for a smart home device"

# Technical explanations
fmodcli "Explain quantum computing in simple terms for a general audience"

# Code documentation
fmodcli "Write comprehensive documentation for a REST API endpoint"
```

### Structured Output
```bash
# Get JSON responses for programmatic use
fmodcli --output json "Extract key insights from quarterly sales data"

# Format for specific use cases
fmodcli --output json "Create a project roadmap with milestones and deadlines"
```

### Available Commands
```bash
# List all available models
fmodcli models

# View usage examples
fmodcli examples

# Get detailed help
fmodcli --help
```

## 🏗️ Architecture

FModCLI is built with a modular architecture that emphasizes reliability and extensibility:

```
┌─────────────────┐    ┌──────────────────┐    ┌─────────────────┐
│   ArgumentParser │ -> │   Command Layer  │ -> │ FoundationModels│
│   (CLI Interface)│    │   (Business Logic)│   │ (Apple Intelligence)│
└─────────────────┘    └──────────────────┘    └─────────────────┘
```

- **CLI Layer**: Professional argument parsing with ArgumentParser
- **Command Layer**: Clean command structure with async/await support
- **Foundation Layer**: Direct integration with Apple's FoundationModels framework

## 🔧 Advanced Usage

### Custom Output Formats
FModCLI supports multiple output formats to integrate with your existing workflows:

```bash
# Raw text (default)
fmodcli "Your prompt here"

# Structured JSON for APIs
fmodcli --output json "Your prompt here"
```

### Session Management
```bash
# Future feature: Maintain conversation context
fmodcli --session my-project "Continue our discussion about API design"
```

## 🤝 Contributing

We welcome contributions! Please see our [Contributing Guidelines](CONTRIBUTING.md) for details.

### Development Setup
```bash
git clone https://github.com/yourusername/FModCLI.git
cd FModCLI
swift build
swift test
```

### Code Quality
- Follow Swift API Design Guidelines
- Include comprehensive documentation
- Add tests for new features
- Ensure compatibility with supported macOS versions

## 📖 Documentation

- [API Reference](Documentation/API-Reference.md)
- [Installation Guide](Documentation/Installation.md)
- [Advanced Usage](Documentation/Advanced-Usage.md)
- [Examples Gallery](Documentation/Examples.md)

## 🔒 Security & Privacy

FModCLI is designed with privacy as a core principle:

- **On-Device Processing**: All AI computations happen locally on your Mac
- **Zero Data Collection**: We don't collect, store, or transmit your data
- **Apple Intelligence**: Leverages Apple's privacy-focused AI framework
- **Open Source**: Full transparency through open source code

## 📋 Roadmap

- [ ] **v1.1**: Enhanced output formatting options
- [ ] **v1.2**: Session management and conversation context
- [ ] **v1.3**: Batch processing capabilities
- [ ] **v1.4**: Plugin system for custom integrations
- [ ] **v2.0**: Multi-model support and advanced configurations

## ⚠️ Compatibility Notes

- **Apple Intelligence and FoundationModels** require macOS 26.0+ and compatible hardware
- **M1/M2/M3 Macs** provide the best performance and compatibility for AI operations
- **Intel Macs** may have limited or no Apple Intelligence support

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- **Apple** for FoundationModels and Apple Intelligence
- **Swift ArgumentParser** team for excellent CLI tooling
- **Open Source Community** for inspiration and best practices

## 📞 Support

- **Issues**: [GitHub Issues](https://github.com/yourusername/FModCLI/issues)
- **Discussions**: [GitHub Discussions](https://github.com/yourusername/FModCLI/discussions)
- **Documentation**: [Wiki](https://github.com/yourusername/FModCLI/wiki)

---

**Built with ❤️ for the Apple developer community. Empowering innovation through accessible AI.**
