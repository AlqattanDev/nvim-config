return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

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

  -- Quality of life plugins collection
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      -- Core modules (keep enabled)
      bigfile = { enabled = true },
      gitbrowse = { enabled = true },
      lazygit = { enabled = true },
      notify = { enabled = true },
      quickfile = { enabled = true },
      scroll = { enabled = true },
      statuscolumn = { enabled = true },
      words = { enabled = true },
      zen = { enabled = true },
      
      -- Terminal management (switched from NvChad)
      terminal = { enabled = true },
      
      -- Safe additions (no conflicts)
      animate = { enabled = true },
      debug = { enabled = true },
      dim = { enabled = true },
      input = { enabled = true },
      layout = { enabled = true },
      profiler = { enabled = true },
      rename = { enabled = true },
      scope = { enabled = true },
      scratch = { enabled = true },
      toggle = { enabled = true },
      image = { enabled = true },
      
      -- Disable conflicting modules
      dashboard = { enabled = false }, -- NvChad has its own
      explorer = { enabled = false }, -- NvChad has file explorer
      picker = { enabled = false }, -- NvChad uses telescope
      indent = { enabled = false }, -- Keep NvChad's indent-blankline
      bufdelete = { enabled = false }, -- Keep NvChad's tabufline
    },
  },

  -- AI-powered code assistance
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = false,
    version = false,
    opts = {
      provider = "claude",
      mappings = {
        ask = "<leader>aa",
        edit = "<leader>ae",
        refresh = "<leader>ar",
        diff = {
          ours = "co",
          theirs = "ct",
          all_theirs = "ca",
          both = "cb",
          cursor = "cc",
          next = "]x",
          prev = "[x",
        },
        suggestion = {
          accept = "<M-l>",
          next = "<M-]>",
          prev = "<M-[>",
          dismiss = "<C-]>",
        },
      },
    },
    build = "make",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
    },
  },

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}
