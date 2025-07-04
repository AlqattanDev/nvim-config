---@type LazySpec
-- UI enhancements and visual improvements
return {
  -- Enhanced markdown rendering
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    ft = "markdown",
    opts = {},
  },

  -- Fun cellular automaton animations
  {
    "Eandrju/cellular-automaton.nvim",
    cmd = "CellularAutomaton",
  },

  -- Quality of life plugins collection
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = require "configs.snacks",
    init = function()
      vim.api.nvim_create_autocmd("User", {
        pattern = "VeryLazy",
        callback = function()
          -- Setup vim.ui.input to use snacks
          vim.ui.input = Snacks.input
        end,
      })
    end,
  },
}