---@type conform.Options
-- Code formatting configuration with sensible defaults
local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettier" },
    html = { "prettier" },
    javascript = { "prettier" },
    typescript = { "prettier" },
    json = { "prettier" },
    markdown = { "prettier" },
    yaml = { "prettier" },
    
    -- Enhanced Python formatting with multiple options
    python = { 
      "ruff_fix",    -- Fast linter/formatter (preferred if available)
      "ruff_format", -- Ruff's formatter  
      "black",       -- Fallback to black (currently installed)
    },
    
    -- Rust formatting
    rust = { "rustfmt" },
    
    -- Go formatting with import management
    go = { 
      "goimports",   -- Imports management + formatting (preferred)
      "gofmt",       -- Standard Go formatter (fallback)
    },
  },

  -- Enhanced Python formatters configuration
  formatters = {
    ruff_fix = {
      command = "ruff",
      args = { "check", "--fix", "--stdin-filename", "$FILENAME", "-" },
      stdin = true,
    },
    ruff_format = {
      command = "ruff",
      args = { "format", "--stdin-filename", "$FILENAME", "-" },
      stdin = true,
    },
    -- Enhanced black configuration
    black = {
      prepend_args = { "--line-length", "88" },
    },
    -- Enhanced rustfmt configuration
    rustfmt = {
      prepend_args = { "--edition", "2021" },
    },
  },

  -- Optional: Enable format on save
  format_on_save = function(bufnr)
    -- Disable with a global or buffer-local variable
    if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
      return
    end
    return {
      timeout_ms = 1000,  -- Increased timeout for Go/Rust compilation
      lsp_fallback = true,
    }
  end,

  -- Optional: Format after save for async formatters
  format_after_save = function(bufnr)
    if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
      return
    end
    return { lsp_fallback = true }
  end,
}

return options
