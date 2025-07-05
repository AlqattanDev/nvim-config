#!/bin/bash

# Neovim Language Support Dependencies Installation Script
# This script installs all required LSP servers, formatters, and tools for Python, Rust, and Go development

echo "Installing Neovim development dependencies..."

# Python Dependencies
echo "Installing Python tools..."
brew install pyright          # Python LSP server
brew install ruff             # Modern Python linter/formatter
brew install black            # Python code formatter

# Rust Dependencies
echo "Installing Rust tools..."
brew install rust-analyzer    # Rust LSP server
# rustfmt comes with Rust toolchain, but ensure it's available
rustup component add rustfmt

# Go Dependencies
echo "Installing Go tools..."
brew install gopls            # Go LSP server
brew install go               # Go programming language (includes gofmt)
go install golang.org/x/tools/cmd/goimports@latest  # Go import formatter

# JSON/YAML Tools
echo "Installing JSON/YAML tools..."
brew install jq               # JSON processor (useful for debugging)
brew install yq               # YAML processor

# Additional Development Tools
echo "Installing additional development tools..."
brew install tree-sitter      # Tree-sitter CLI for syntax highlighting
brew install ripgrep          # Fast grep alternative (used by telescope)
brew install fd               # Fast find alternative (used by telescope)
brew install git-delta        # Better git diff viewer
brew install stylua           # Lua formatter

echo "All dependencies installed successfully!"
echo ""
echo "Manual steps still required:"
echo "1. Restart Neovim to trigger plugin installation"
echo "2. Run :checkhealth to verify all tools are working"
echo "3. For Python: Set up virtual environments as needed"
echo "4. For Rust: Ensure rust-analyzer is in PATH"
echo "5. For Go: Ensure GOPATH is properly configured"