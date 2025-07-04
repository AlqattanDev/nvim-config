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
    python = { "black" },
  },

  -- Optional: Enable format on save
  format_on_save = function(bufnr)
    -- Disable with a global or buffer-local variable
    if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
      return
    end
    return {
      timeout_ms = 500,
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
