---@type LazySpec
-- Development tools and language-specific plugins
return {
  -- Flutter development tools
  {
    "nvim-flutter/flutter-tools.nvim",
    ft = "dart",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
  },

  -- MCP client integration
  {
    "ravitemer/mcphub.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
  },
}