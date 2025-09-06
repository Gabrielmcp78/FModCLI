# API Reference

## Core Commands

### `fmodcli run` (Default Command)

Generate text using Apple Intelligence.

**Syntax:**
```bash
fmodcli [run] "<prompt>" [--output <format>]
```

**Parameters:**
- `prompt` (required): The text prompt to send to Apple Intelligence
- `--output, -o` (optional): Output format (`text` or `json`). Default: `text`

**Examples:**
```bash
# Basic text generation
fmodcli "Write a professional email about project updates"

# JSON output for programmatic use
fmodcli --output json "Summarize the key benefits of renewable energy"

# Using explicit 'run' command
fmodcli run "Explain machine learning concepts for beginners"
```

**Response Formats:**

*Text Output:*
```
Your generated response text appears here...
```

*JSON Output:*
```json
{
  "prompt": "Your input prompt",
  "result": "Generated response text",
  "model": "SystemLanguageModel",
  "timestamp": "2025-01-20T10:30:00Z"
}
```

### `fmodcli models`

List available Apple Intelligence models.

**Syntax:**
```bash
fmodcli models
```

**Example Output:**
```
Available model:
- SystemLanguageModel (default)
  Status: Available
  Capabilities: Text generation, comprehension, analysis
```

### `fmodcli examples`

Display usage examples and common patterns.

**Syntax:**
```bash
fmodcli examples
```

**Output:**
Shows comprehensive examples for various use cases including text generation, JSON output, and available commands.

## Global Options

### `--help, -h`
Show help information for any command.

```bash
fmodcli --help
fmodcli run --help
fmodcli models --help
```

### `--version`
Display the current version of FModCLI.

```bash
fmodcli --version
```

## Core Classes and Functions

### FoundationModelsCaller

The main interface for Apple Intelligence integration.

#### Methods

**`run(prompt:system:model:tools:output:transcriptPath:template:sessionID:)`**

Primary method for text generation with comprehensive options.

- **prompt**: The input text prompt
- **system**: Optional system instructions for behavior control
- **model**: Model selection (defaults to system model)
- **tools**: Enable additional capabilities (future feature)
- **output**: Response format (`"text"` or `"json"`)
- **transcriptPath**: Save conversation transcript (future feature)
- **template**: Apply output template formatting (future feature)
- **sessionID**: Maintain conversation context (future feature)

**`listAvailableModels(output:)`**

Query available Apple Intelligence models.

- **output**: Format for model information (`"text"` or `"json"`)

### SimpleFModCaller

Simplified interface for common use cases.

#### Methods

**`run(prompt:output:)`**

Streamlined text generation for basic use cases.

```swift
await SimpleFModCaller.run(prompt: "Your prompt", output: "text")
```

**`listModels()`**

Quick model listing for CLI usage.

```swift
SimpleFModCaller.listModels()
```

## Error Handling

### Common Error Types

**`modelUnavailable`**
- **Cause**: Apple Intelligence not available on current system
- **Solution**: Upgrade to compatible macOS version and hardware

**`executionFailed(String)`**
- **Cause**: Processing error during text generation
- **Solution**: Check prompt format and system availability

### Error Messages

**"This tool requires macOS 26.0+ with Apple Intelligence support"**
- Appears when full Apple Intelligence features are unavailable
- Basic functionality may still work on supported older systems

## Platform Compatibility

| Feature | macOS 10.15+ | macOS 26.0+ |
|---------|--------------|-------------|
| CLI Interface | ✅ | ✅ |
| Basic Commands | ✅ | ✅ |
| Apple Intelligence | ❌ | ✅ |
| Full Feature Set | ❌ | ✅ |

## Advanced Configuration

### Environment Variables

Currently, FModCLI uses Apple's system defaults. Future versions may support:

- `FMODCLI_MODEL`: Default model selection
- `FMODCLI_OUTPUT`: Default output format
- `FMODCLI_TEMPLATE_PATH`: Custom template directory

### Configuration Files

Future releases will support configuration files for:
- Default settings
- Custom templates
- Model preferences
- Output formatting

## Integration Examples

### Shell Scripts

```bash
#!/bin/bash
# Generate documentation
result=$(fmodcli --output json "Explain the benefits of $1")
echo "$result" | jq -r '.result'
```

### Swift Integration

```swift
import Foundation

// If building as a library (future feature)
let result = await FoundationModelsCaller.run(
    prompt: "Your prompt here",
    output: "json"
)
```

### Python Integration

```python
import subprocess
import json

def generate_text(prompt):
    result = subprocess.run(
        ['fmodcli', '--output', 'json', prompt],
        capture_output=True,
        text=True
    )
    return json.loads(result.stdout)
```

## Best Practices

1. **Prompt Engineering**: Be specific and clear in your prompts
2. **Output Format**: Use JSON for programmatic integration
3. **Error Handling**: Always check for error conditions in scripts
4. **Performance**: Apple Intelligence is optimized for local processing
5. **Privacy**: All processing happens on-device for maximum privacy

## Roadmap

Future API enhancements:
- Session management for conversation context
- Custom model selection
- Template system for output formatting
- Batch processing capabilities
- Plugin architecture for extensions
