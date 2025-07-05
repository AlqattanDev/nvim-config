---@type LazySpec
-- AI-powered development assistance
return {
  -- AI-powered code assistance
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = false,
    version = false,
    opts = require "configs.avante",
    build = "make",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
    },
  },

  -- Claudia nvim-ui integration
  {
    dir = "/Users/alialqattan/Clones/claudia/nvim-ui",
    name = "claudia",
    lazy = false,
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lualine/lualine.nvim",
    },
    config = function()
      require("configs.claudia")
    end,
  },
}