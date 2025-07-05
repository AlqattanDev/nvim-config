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
- `lua/options.lua`: Enhanced vim options with development-focused defaults
- `lua/mappings.lua`: Organized key mappings with error handling and logical grouping
- `lua/autocmds.lua`: Auto commands (imports nvchad.autocmds)
- `lua/plugins/`: Modular plugin specifications
  - `init.lua`: Main plugin entry point with module imports
  - `core.lua`: Essential development tools (LSP, formatting)
  - `ui.lua`: UI enhancements and visual improvements
  - `dev.lua`: Language-specific development tools
  - `ai.lua`: AI-powered development assistance
- `lua/configs/`: Plugin-specific configurations
  - `lazy.lua`: Lazy.nvim configuration with performance optimizations
  - `lspconfig.lua`: LSP server configuration
  - `conform.lua`: Enhanced code formatting with multiple languages
  - `snacks.lua`: Comprehensive snacks.nvim configuration
  - `avante.lua`: AI assistant configuration

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

### UI Enhancements
- **lualine.nvim**: Modern statusline with clean design
  - Onedark theme integration for consistency  
  - Standard components for encoding, filetype, and progress

### Quality of Life
- **snacks.nvim**: Comprehensive collection of 27 utility modules (19 enabled)
  - **Enabled modules**: terminal, animate, bigfile, debug, dim, git, gitbrowse, input, layout, lazygit, notify, profiler, quickfile, rename, scope, scratch, scroll, statuscolumn, toggle, words, zen, image
  - **Disabled for compatibility**: dashboard, explorer, picker (conflicts with NvChad), indent, bufdelete (prefer NvChad versions)
  - **Terminal management**: Switched from NvChad to snacks terminal system

### AI Integration
- **avante.nvim**: AI-powered code assistance with Claude integration
  - Requires API key configuration for full functionality
  - Custom keybindings under `<leader>a` prefix to avoid conflicts


## Custom Keybindings

### File Management
- `<leader>e`: Toggle file explorer (open/close)

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

### Terminal Management (Snacks)
- `<leader>tt`: Toggle terminal
- `<leader>th`: Terminal horizontal split
- `<leader>tv`: Terminal vertical split  
- `<leader>tf`: Terminal floating window
- `<C-/>`: Hide terminal (in terminal mode)

### Utilities (Snacks)
- `<leader>z`: Toggle zen mode
- `<leader>un`: Dismiss notifications
- `<leader>N`: Notification history
- `]]` / `[[`: Jump between word references
- `<leader>.`: Toggle scratch buffer
- `<leader>S`: Select scratch buffer
- `<leader>cR`: Rename file (LSP)
- `<leader>ps`: Profiler scratch buffer


### Configuration Management
- `<leader>uf`: Toggle autoformat on/save globally

## Recent Improvements (Latest Update)

### ✅ **Enterprise Language Support**
- **Python**: Complete pyright LSP + ruff/black formatting + virtual environment management
- **Rust**: Advanced rust-analyzer + rustfmt + clippy integration + inlay hints
- **Go**: Full gopls + goimports/gofmt + comprehensive Go tooling integration
- **Debugging**: DAP support for all three languages with visual debugging interface

### ✅ **Enhanced User Experience**
- **Which-key Integration**: Organized keybinding popup with logical grouping
- **Image Rendering**: Optimized for Ghostty terminal with kitty graphics protocol
- **File Explorer**: Fixed `<leader>e` to properly toggle open/close
- **Dependencies**: Complete installation script (`dependencies.sh`) with all required tools

### ✅ **Advanced Features**
- **Treesitter Text Objects**: Enhanced code navigation (`af`, `ac`, `aa`, etc.)
- **Comprehensive Formatting**: Multi-tier formatting with fallbacks
- **Error-Free Health**: All checkhealth validations passing
- **Professional Statusline**: Clean lualine configuration with onedark theme

## Development Notes

### Architecture Improvements
- **Modular Plugin System**: Split into logical modules (core, ui, dev, ai) for better organization
- **Separated Configurations**: Large plugin configs extracted to dedicated files in `lua/configs/`
- **Enhanced Error Handling**: Graceful degradation with pcall protection for all plugin functionality
- **Type Safety**: Added Lua type annotations for better development experience

### Performance Optimizations
- **Lazy Loading**: Optimized plugin loading strategies with event-based triggers
- **Startup Performance**: Reduced configuration complexity for faster boot times
- **Resource Management**: Better memory usage with conditional feature loading

### Quality Improvements
- **Enhanced Options**: Development-focused vim options with sensible defaults
- **Improved Mappings**: Organized keybindings with comprehensive error handling
- **Better Documentation**: Type annotations and inline documentation throughout

### Legacy Features
- Configuration loads NvChad defaults first, then applies custom overrides
- The configuration extends NvChad rather than replacing core functionality
- **Terminal System**: Switched from NvChad terminal to snacks.nvim terminal for enhanced functionality
- **Conflict Resolution**: Carefully disabled conflicting modules (dashboard, explorer, picker, indent, bufdelete)
- **19 of 27 snacks modules enabled** for maximum functionality without conflicts
- Avante.nvim requires API key setup for AI features to work

### User Experience
- **Format Toggle**: `<leader>uf` to toggle autoformat globally
- **Error Notifications**: Clear feedback when plugins or features fail
- **Graceful Degradation**: Configuration works even if optional plugins fail to load

## Plugin Management & Conflict Resolution

### Disabling NvChad Default Plugins
To disable any default NvChad plugin, add it to your plugin specification with `enabled = false`:

```lua
return {
  { "plugin-name", enabled = false }
}
```

Common plugins you might want to disable:
- `nvim-tree/nvim-tree.lua`: Default file explorer
- `folke/which-key.nvim`: Keybinding helper
- `lewis6991/gitsigns.nvim`: Git decorations

### Handling Plugin Conflicts
When using external plugins that conflict with NvChad defaults:

**Snacks modules that conflict with NvChad:**
- `dashboard = false` (prefer NvChad nvdash)
- `explorer = false` (prefer NvChad file explorer)
- `picker = false` (prefer NvChad telescope)
- `indent = false` (prefer NvChad indent-blankline)
- `bufdelete = false` (prefer NvChad tabufline)

**Best practices:**
- Keep NvChad versions for better integration
- Use `enabled = false` for conflicting external modules
- Test configuration after making changes

### Plugin Debugging Commands
```bash
nvim +Lazy                     # Open lazy.nvim plugin manager
nvim +checkhealth              # Check plugin health and dependencies
nvim --headless +qa            # Test if config loads without errors
```

### Plugin Loading Issues
If you experience dual components (like file explorers):
1. Identify conflicting plugins
2. Disable the external plugin's conflicting module
3. Use NvChad's default implementation
4. Update keybindings to match the chosen implementation

