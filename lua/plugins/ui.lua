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

  -- Statusline plugin for Claudia integration
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
    config = function()
      require("lualine").setup({
        options = {
          theme = "onedark",
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch", "diff", "diagnostics" },
          lualine_c = { "filename" },
          lualine_x = { 
            function()
              -- Claudia status integration
              local ok, claudia = pcall(require, "claudia")
              if ok then
                local active_session = claudia.get_active_session()
                if active_session then
                  local needs_attention = claudia.get_session_attention_status(active_session)
                  local attention_indicator = needs_attention and " ●" or ""
                  return " Claudia: " .. active_session .. attention_indicator .. " "
                end
              end
              return ""
            end,
            "encoding", 
            "fileformat", 
            "filetype" 
          },
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
      })
    end,
  },

  -- Which-key for keybinding help
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      local ok, wk = pcall(require, "which-key")
      if not ok then
        return
      end
      
      wk.setup({
        -- Configuration
        preset = "modern",
        delay = function(ctx)
          return ctx.plugin and 0 or 200
        end,
        filter = function(mapping)
          -- Hide mappings that don't have descriptions
          return mapping.desc and mapping.desc ~= ""
        end,
        spec = {
          mode = { "n", "v" },
          { "<leader>a", group = "AI" },
          { "<leader>b", group = "Buffer" },
          { "<leader>c", group = "Code" },
          { "<leader>d", group = "Debug" },
          { "<leader>f", group = "Find" },
          { "<leader>g", group = "Git" },
          { "<leader>gs", group = "Go" },
          { "<leader>h", group = "Help" },
          { "<leader>l", group = "LSP" },
          { "<leader>n", group = "Notes" },
          { "<leader>r", group = "Replace" },
          { "<leader>s", group = "Search" },
          { "<leader>t", group = "Terminal" },
          { "<leader>u", group = "Utils" },
          { "<leader>v", group = "Venv" },
          { "<leader>w", group = "Window" },
          { "<leader>x", group = "Trouble" },
        },
        icons = {
          breadcrumb = "»",
          separator = "➜",
          group = "+",
        },
        -- Layout configuration
        layout = {
          height = { min = 4, max = 25 },
          width = { min = 20, max = 50 },
          spacing = 3,
          align = "left",
        },
        -- Show help message
        show_help = true,
        show_keys = true,
        triggers = {
          { "<auto>", mode = "nixsotc" },
          { "<leader>", mode = { "n", "v" } },
        },
      })
    end,
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