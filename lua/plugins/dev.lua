---@type LazySpec
-- Development tools and language-specific plugins
return {
  -- Flutter development tools (existing)
  {
    "nvim-flutter/flutter-tools.nvim",
    ft = "dart",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
  },

  -- MCP client integration (existing)
  {
    "ravitemer/mcphub.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
  },

  -- PYTHON DEVELOPMENT ENHANCEMENTS
  {
    "linux-cultist/venv-selector.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    ft = "python",
    opts = {
      settings = {
        options = {
          notify_user_on_venv_activation = true,
          enable_default_searches = true,
          enable_cached_venvs = true,
        },
      },
    },
    keys = {
      { "<leader>vs", "<cmd>VenvSelect<cr>", desc = "Select Python Virtual Environment" },
      { "<leader>vc", "<cmd>VenvSelectCached<cr>", desc = "Select Cached Python Environment" },
    },
  },

  -- RUST DEVELOPMENT ENHANCEMENTS
  {
    "mrcjkb/rustaceanvim",
    version = "^5",
    ft = "rust",
    config = function()
      vim.g.rustaceanvim = {
        inlay_hints = {
          highlight = "NonText",
        },
        tools = {
          hover_actions = {
            auto_focus = true,
          },
        },
        server = {
          on_attach = function(_, bufnr)
            local opts = { buffer = bufnr, noremap = true, silent = true }
            vim.keymap.set("n", "<leader>cR", function()
              vim.cmd.RustLsp("codeAction")
            end, vim.tbl_extend("force", opts, { desc = "Rust Code Action" }))
            vim.keymap.set("n", "<leader>dr", function()
              vim.cmd.RustLsp("debuggables")
            end, vim.tbl_extend("force", opts, { desc = "Rust Debuggables" }))
            vim.keymap.set("n", "<leader>rr", function()
              vim.cmd.RustLsp("runnables")
            end, vim.tbl_extend("force", opts, { desc = "Rust Runnables" }))
          end,
        },
      }
    end,
  },

  -- GO DEVELOPMENT ENHANCEMENTS
  {
    "ray-x/go.nvim",
    dependencies = {
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    ft = { "go", "gomod", "gowork", "gotmpl" },
    build = ':lua require("go.install").update_all_sync()',
    config = function()
      require("go").setup({
        goimports = "goimports",
        gofmt = "gofmt",
        max_line_len = 120,
        tag_transform = false,
        test_dir = "",
        comment_placeholder = "   ",
        lsp_cfg = false, -- Use our enhanced LSP config
        lsp_gofumpt = true,
        lsp_on_attach = false,
        dap_debug = true,
        dap_debug_gui = true,
        -- Go tool settings
        go = "go", -- go command
        buildtag = "tag",
        textobjects = true,
        test_runner = "go", -- richgo, go test, richgo, dlv, ginkgo
        verbose_tests = true,
        run_in_floaterm = false,
        luasnip = true,
      })
    end,
    keys = {
      { "<leader>gsj", "<cmd>GoAddTag json<cr>", desc = "Go: Add json tags" },
      { "<leader>gsy", "<cmd>GoAddTag yaml<cr>", desc = "Go: Add yaml tags" },
      { "<leader>gsr", "<cmd>GoRmTag<cr>", desc = "Go: Remove tags" },
      { "<leader>gst", "<cmd>GoTestAdd<cr>", desc = "Go: Add test" },
      { "<leader>gsc", "<cmd>GoCoverage<cr>", desc = "Go: Coverage" },
      { "<leader>gss", "<cmd>GoRun<cr>", desc = "Go: Run" },
      { "<leader>gsb", "<cmd>GoBuild<cr>", desc = "Go: Build" },
      { "<leader>gsi", "<cmd>GoInstall<cr>", desc = "Go: Install" },
      { "<leader>gsl", "<cmd>GoLint<cr>", desc = "Go: Lint" },
      { "<leader>gsv", "<cmd>GoVet<cr>", desc = "Go: Vet" },
      { "<leader>gsm", "<cmd>GoMod<cr>", desc = "Go: Mod tidy" },
    },
  },

  -- TREESITTER TEXT OBJECTS for better code navigation
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    dependencies = "nvim-treesitter/nvim-treesitter",
    event = "VeryLazy",
  },

  -- DEBUGGING SUPPORT
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
      "nvim-neotest/nvim-nio",
    },
    ft = { "python", "rust", "go" },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      
      -- DAP UI setup
      dapui.setup()
      
      -- Auto open/close DAP UI
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
      
      -- Virtual text setup
      require("nvim-dap-virtual-text").setup()
    end,
    keys = {
      { "<leader>db", "<cmd>DapToggleBreakpoint<cr>", desc = "Debug: Toggle Breakpoint" },
      { "<leader>dc", "<cmd>DapContinue<cr>", desc = "Debug: Continue" },
      { "<leader>di", "<cmd>DapStepInto<cr>", desc = "Debug: Step Into" },
      { "<leader>do", "<cmd>DapStepOver<cr>", desc = "Debug: Step Over" },
      { "<leader>dO", "<cmd>DapStepOut<cr>", desc = "Debug: Step Out" },
      { "<leader>dt", "<cmd>DapTerminate<cr>", desc = "Debug: Terminate" },
      { "<leader>du", "<cmd>lua require('dapui').toggle()<cr>", desc = "Debug: Toggle UI" },
    },
  },
}