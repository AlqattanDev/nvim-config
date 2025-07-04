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
  image = { enabled = true },
  
  -- Disable conflicting modules
  dashboard = { enabled = false }, -- NvChad has its own
  explorer = { enabled = false }, -- NvChad has file explorer
  picker = { enabled = false }, -- NvChad uses telescope
  indent = { enabled = false }, -- Keep NvChad's indent-blankline
  bufdelete = { enabled = false }, -- Keep NvChad's tabufline
}

return M