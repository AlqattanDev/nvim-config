# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Architecture Overview

This is a NvChad-based Neovim configuration that uses the NvChad framework as a plugin. The configuration follows NvChad's v2.5 architecture:

- **NvChad Integration**: The main NvChad repo is imported as a plugin (`NvChad/NvChad` v2.5 branch)
- **Plugin Management**: Uses lazy.nvim for plugin management with lazy loading enabled by default
- **Configuration Structure**: Modular setup with separate files for different concerns
- **Theme System**: Uses base46 theme system with "onedark" as default theme

## Key Files and Structure

- `init.lua`: Main entry point that bootstraps lazy.nvim and loads the configuration
- `lua/chadrc.lua`: NvChad-specific configuration (theme, UI settings)
- `lua/options.lua`: Vim options (imports nvchad.options and adds custom settings)
- `lua/mappings.lua`: Key mappings (imports nvchad.mappings and adds custom keymaps)
- `lua/autocmds.lua`: Auto commands (imports nvchad.autocmds)
- `lua/plugins/init.lua`: Custom plugin specifications
- `lua/configs/`: Configuration files for specific plugins
  - `lazy.lua`: Lazy.nvim configuration with performance optimizations
  - `lspconfig.lua`: LSP server configuration (currently html, cssls)
  - `conform.lua`: Code formatting configuration (stylua for Lua)

## Common Development Commands

### Formatting
```bash
stylua . --check        # Check Lua formatting
stylua .                # Format all Lua files
```

### Neovim Configuration Management
```bash
nvim +Lazy              # Open lazy.nvim plugin manager
nvim +checkhealth       # Check Neovim health
nvim +LspInfo           # Check LSP server status
```

### Testing Configuration
```bash
nvim --headless +qa     # Test if config loads without errors
```

## Configuration Guidelines

### Adding Plugins
- Add plugin specifications to `lua/plugins/init.lua`
- Create plugin-specific config files in `lua/configs/` if needed
- Follow lazy.nvim specification format

### LSP Configuration
- Add new language servers to the `servers` table in `lua/configs/lspconfig.lua`
- Use `vim.lsp.enable()` for simple server setup
- Refer to `:h vim.lsp.config` for advanced configuration

### Code Formatting
- Configure formatters in `lua/configs/conform.lua`
- Stylua configuration is in `.stylua.toml` with 2-space indentation
- Format-on-save is available but currently commented out

### Key Mappings
- Add custom mappings to `lua/mappings.lua`
- Use `vim.keymap.set()` function
- Follow the existing pattern of importing nvchad mappings first

### Theme and UI
- Modify theme and UI settings in `lua/chadrc.lua`
- Available themes and options documented in NvChad UI repo
- Base46 cache is used for theme loading

## Installed Plugins

### Core Extensions
- **render-markdown.nvim**: Enhanced markdown rendering with better visual styling
- **cellular-automaton.nvim**: Fun code animations (`:CellularAutomaton make_it_rain`)
- **flutter-tools.nvim**: Flutter development tools with hot reload and device management
- **mcphub.nvim**: MCP (Model Context Protocol) client integration

### Quality of Life
- **snacks.nvim**: Collection of useful utilities (git integration, smooth scrolling, zen mode)
  - Configured to avoid conflicts with NvChad (dashboard, explorer, picker disabled)
  - Enables: git tools, lazygit, notifications, scroll, zen mode, word highlighting

### AI Integration
- **avante.nvim**: AI-powered code assistance with Claude integration
  - Requires API key configuration for full functionality
  - Custom keybindings under `<leader>a` prefix to avoid conflicts

## Custom Keybindings

### Fun Features
- `<leader>fml`: Make it rain animation
- `<leader>gol`: Game of life animation

### Git Integration (Snacks)
- `<leader>gB`: Git browse in browser
- `<leader>gb`: Git blame current line
- `<leader>gf`: File history in lazygit
- `<leader>gg`: Open lazygit
- `<leader>gl`: Git log in lazygit

### AI Assistant (Avante)
- `<leader>aa`: Ask AI about code
- `<leader>ae`: Edit with AI suggestions
- `<leader>ar`: Refresh AI response
- `<M-l>`: Accept AI suggestion
- `<M-]>` / `<M-[>`: Navigate suggestions

### Utilities
- `<leader>z`: Toggle zen mode
- `<leader>un`: Dismiss notifications
- `]]` / `[[`: Jump between word references

## Development Notes

- Configuration loads NvChad defaults first, then applies custom overrides
- Lazy loading is enabled by default for performance
- Many built-in Vim plugins are disabled in lazy.nvim config for performance
- The configuration is designed to be minimal and extend NvChad rather than replace it
- New plugins are configured to avoid conflicts with existing NvChad functionality
- Avante.nvim requires API key setup for AI features to work