---@type LazySpec
-- Core development tools and essential functionality
return {
  -- Code formatting
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    cmd = { "ConformInfo" },
    opts = require "configs.conform",
  },

  -- Language Server Protocol
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require "configs.lspconfig"
    end,
  },
}