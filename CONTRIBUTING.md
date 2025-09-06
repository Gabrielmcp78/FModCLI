# Contributing to FModCLI

We welcome contributions to FModCLI! This document provides guidelines for contributing to the project.

## 🤝 How to Contribute

### Reporting Issues

1. **Check existing issues** first to avoid duplicates
2. **Use issue templates** when reporting bugs or requesting features
3. **Provide detailed information** including:
   - macOS version
   - Hardware (Intel/Apple Silicon)
   - FModCLI version
   - Steps to reproduce
   - Expected vs actual behavior

### Suggesting Features

1. **Open a discussion** before implementing large features
2. **Describe the use case** and why it's valuable
3. **Consider backward compatibility** with existing functionality
4. **Propose implementation approach** if you have ideas

### Submitting Pull Requests

1. **Fork the repository** and create a feature branch
2. **Follow coding standards** outlined below
3. **Add tests** for new functionality
4. **Update documentation** as needed
5. **Ensure all tests pass** before submitting
6. **Write clear commit messages** following conventional commits

## 🏗️ Development Setup

### Prerequisites

- macOS 10.15+ (macOS 26.0+ for full testing)
- Xcode Command Line Tools
- Swift 6.0+
- Git

### Getting Started

```bash
# Fork and clone your fork
git clone https://github.com/yourusername/FModCLI.git
cd FModCLI

# Create a feature branch
git checkout -b feature/your-feature-name

# Build the project
swift build

# Run tests
swift test

# Test your changes
./.build/debug/fmodcli --help
```

## 📝 Coding Standards

### Swift Style Guide

We follow the [Swift API Design Guidelines](https://swift.org/documentation/api-design-guidelines/) with these additional conventions:

#### File Organization

```
Sources/FModCLI/
├── main.swift              # Entry point
├── Commands/               # Command implementations
│   ├── RunCommand.swift
│   ├── ModelsCommand.swift
│   └── ExamplesCommand.swift
├── Core/                   # Core functionality
│   ├── FoundationModelsSDK.swift
│   ├── SimpleFModCaller.swift
│   └── FModCLI.swift
└── Extensions/             # Helper extensions
    └── ArgumentParser+Extensions.swift
```

#### Naming Conventions

- **Types**: PascalCase (`FoundationModelsCaller`)
- **Functions/Variables**: camelCase (`outputMode`, `listModels`)
- **Constants**: camelCase (`defaultModel`)
- **Files**: Match primary type name (`RunCommand.swift`)

#### Documentation

All public APIs must include documentation:

```swift
/// Execute Foundation Models with user prompts
/// 
/// This command provides the primary interface for text generation using
/// Apple Intelligence on-device models.
/// 
/// - Parameters:
///   - prompt: The text prompt to send to the model
///   - output: Output format ("text" or "json")
/// 
/// - Returns: Generated text response
struct RunCommand: ParsableCommand {
    // Implementation
}
```

#### Error Handling

Use Swift's built-in error handling:

```swift
enum FModCLIError: Error, LocalizedError {
    case modelUnavailable
    case invalidConfiguration(String)
    
    var errorDescription: String? {
        switch self {
        case .modelUnavailable:
            return "Apple Intelligence model is not available"
        case .invalidConfiguration(let details):
            return "Configuration error: \(details)"
        }
    }
}
```

### Code Quality

- **No force unwrapping** (`!`) except in clearly safe contexts
- **Prefer optionals** over default values where appropriate
- **Use meaningful variable names** that explain intent
- **Keep functions focused** on single responsibilities
- **Add comments** for complex logic or Apple Intelligence integration

## 🧪 Testing Guidelines

### Test Structure

```bash
Tests/FModCLITests/
├── CommandTests/
│   ├── RunCommandTests.swift
│   └── ModelsCommandTests.swift
├── CoreTests/
│   └── FoundationModelsSDKTests.swift
└── IntegrationTests/
    └── CLIIntegrationTests.swift
```

### Writing Tests

```swift
import XCTest
@testable import FModCLI

final class RunCommandTests: XCTestCase {
    func testBasicPromptExecution() throws {
        // Test implementation
    }
    
    func testJSONOutputFormat() throws {
        // Test JSON formatting
    }
    
    func testErrorHandling() throws {
        // Test error conditions
    }
}
```

### Test Categories

1. **Unit Tests**: Individual component functionality
2. **Integration Tests**: Component interaction
3. **CLI Tests**: Command-line interface behavior
4. **Compatibility Tests**: Cross-platform behavior

## 📋 Pull Request Process

### Before Submitting

- [ ] All tests pass locally
- [ ] Code follows style guidelines
- [ ] Documentation is updated
- [ ] CHANGELOG.md is updated (for significant changes)
- [ ] No new compiler warnings
- [ ] Feature works on supported macOS versions

### PR Template

```markdown
## Description
Brief description of changes and motivation.

## Type of Change
- [ ] Bug fix
- [ ] New feature
- [ ] Breaking change
- [ ] Documentation update

## Testing
- [ ] Unit tests added/updated
- [ ] Integration tests pass
- [ ] Manual testing completed

## Checklist
- [ ] Code follows style guidelines
- [ ] Self-review completed
- [ ] Documentation updated
- [ ] No new warnings
```

### Review Process

1. **Automated checks** must pass (CI/CD)
2. **Code review** by maintainers
3. **Testing verification** on different systems
4. **Documentation review** for clarity
5. **Merge approval** by project maintainers

## 🔄 Release Process

### Version Numbering

We use [Semantic Versioning](https://semver.org/):

- **Major**: Breaking changes
- **Minor**: New features (backward compatible)
- **Patch**: Bug fixes (backward compatible)

### Release Checklist

- [ ] Version number updated in `Package.swift`
- [ ] CHANGELOG.md updated with new version
- [ ] All tests passing
- [ ] Documentation reviewed
- [ ] Release notes prepared
- [ ] Binary builds tested

## 🎯 Priority Areas

We're particularly interested in contributions in these areas:

### High Priority
- **Performance optimizations** for Apple Intelligence integration
- **Error handling improvements** with better user messages
- **Documentation enhancements** with more examples
- **Cross-platform testing** on different macOS versions

### Medium Priority
- **New output formats** beyond text and JSON
- **Template system** for custom output formatting
- **Session management** for conversation context
- **Shell completion** for better CLI experience

### Future Features
- **Plugin architecture** for extensibility
- **Batch processing** capabilities
- **Configuration file support**
- **Advanced model selection**

## 🐛 Bug Reports

### Required Information

```markdown
**Environment:**
- macOS Version: (e.g., macOS 26.0)
- Hardware: (e.g., MacBook Pro M3)
- FModCLI Version: (e.g., v1.0.0)

**Description:**
Clear description of the issue.

**Steps to Reproduce:**
1. Step one
2. Step two
3. Step three

**Expected Behavior:**
What should have happened.

**Actual Behavior:**
What actually happened.

**Additional Context:**
Any other relevant information.
```

## 💡 Feature Requests

### Template

```markdown
**Feature Description:**
Clear description of the proposed feature.

**Use Case:**
Why is this feature valuable?

**Proposed Implementation:**
Ideas for how this could be implemented.

**Alternatives Considered:**
Other approaches you've considered.

**Additional Context:**
Any other relevant information.
```

## 📞 Communication

- **GitHub Issues**: Bug reports and feature requests
- **GitHub Discussions**: Questions and general discussion
- **Pull Request Comments**: Code-specific discussion
- **Email**: Maintainer contact for security issues

## 🏆 Recognition

Contributors will be recognized in:
- README.md contributors section
- Release notes for significant contributions
- CHANGELOG.md for bug fixes and features

## 📄 License

By contributing to FModCLI, you agree that your contributions will be licensed under the MIT License.

---

Thank you for contributing to FModCLI! Together we're making Apple Intelligence more accessible to developers and users alike. 🚀
