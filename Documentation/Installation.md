

### Common Issues

#### "Command not found: fmodcli"
```bash
# Check if binary is in PATH
which fmodcli

# If not found, add to PATH or use full path
export PATH="$PATH:/path/to/fmodcli"
```

#### "This tool requires macOS 26.0+ with Apple Intelligence support"
- **Solution**: This message appears on older macOS versions
- **Workaround**: Basic functionality works on macOS 10.15+
- **Recommendation**: Upgrade to macOS 26.0+ for full Apple Intelligence features

#### Build Errors
```bash
# Update Xcode Command Line Tools
sudo xcode-select --reset
xcode-select --install

# Clean and rebuild
swift package clean
swift build -c release
```

#### Permission Denied
```bash
# Fix permissions
chmod +x fmodcli

# Or run with sudo for system installation
sudo cp fmodcli /usr/local/bin/
```

## Uninstallation

```bash
# Remove from system path
sudo rm /usr/local/bin/fmodcli

# Remove source directory (if cloned)
rm -rf FModCLI
```

## Next Steps

- Read the [Quick Start Guide](../README.md#quick-start)
- Explore [Usage Examples](Examples.md)
- Check the [API Reference](API-Reference.md)
