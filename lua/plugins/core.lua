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

  -- Treesitter for enhanced syntax highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup(require "configs.treesitter")
    end,
  },

  -- Schema store for JSON/YAML validation
  {
    "b0o/schemastore.nvim",
    lazy = true,
  },
}