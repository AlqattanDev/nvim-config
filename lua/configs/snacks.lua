---@type snacks.Config
-- Snacks.nvim configuration with selective module enabling
local M = {
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
  -- Enhanced image rendering with Ghostty optimization
  image = { 
    enabled = true,
    -- Terminal integration
    backend = "auto", -- Auto-detect best backend (kitty protocol for Ghostty)
    integrations = {
      markdown = true,
      neorg = false,
    },
    -- Rendering options
    max_width = 100,
    max_height = 50,
    max_height_window_percentage = 50,
    max_width_window_percentage = 50,
    -- Performance options
    window_overlap_clear_enabled = true,
    window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
    -- File type support
    filetypes = { "markdown", "vimwiki", "text", "rst", "org" },
    -- Image formats
    hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.bmp", "*.ico", "*.svg" },
  },
  
  -- Security features
  password = { enabled = true },
  
  -- Enable replacements for NvChad components
  dashboard = { 
    enabled = true,
    sections = {
      { section = "header" },
      { section = "keys", gap = 1, padding = 1 },
      { section = "startup" },
    },
    preset = {
      header = [[
   █████╗ ██████╗  ██████╗     ██████╗ ██████╗ ██╗██████╗  █████╗ 
  ██╔══██╗██╔══██╗██╔═══██╗    ╚════██╗██╔══██╗██║██╔══██╗██╔══██╗
  ███████║██████╔╝██║   ██║     █████╔╝██████╔╝██║██║  ██║███████║
  ██╔══██║██╔══██╗██║   ██║     ╚═══██╗██╔══██╗██║██║  ██║██╔══██║
  ██║  ██║██████╔╝╚██████╔╝    ██████╔╝██████╔╝██║██████╔╝██║  ██║
  ╚═╝  ╚═╝╚═════╝  ╚═════╝     ╚═════╝ ╚═════╝ ╚═╝╚═════╝ ╚═╝  ╚═╝
      ]],
      keys = {
        { icon = " ", key = "f", desc = "Find File", action = ":lua require('telescope.builtin').find_files()" },
        { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
        { icon = " ", key = "r", desc = "Recent Files", action = ":lua require('telescope.builtin').oldfiles()" },
        { icon = " ", key = "g", desc = "Find Text", action = ":lua require('telescope.builtin').live_grep()" },
        { icon = " ", key = "c", desc = "Config", action = ":lua require('telescope.builtin').find_files()" },
        { icon = " ", key = "s", desc = "Restore Session", section = "session" },
        { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
        { icon = " ", key = "q", desc = "Quit", action = ":qa" },
      },
    },
  },
  explorer = { enabled = false }, -- Keep NvChad's default file explorer
  
  -- Disable conflicting modules  
  picker = { enabled = false }, -- NvChad uses telescope
  indent = { enabled = false }, -- Keep NvChad's indent-blankline
  bufdelete = { enabled = false }, -- Keep NvChad's tabufline
}

return M