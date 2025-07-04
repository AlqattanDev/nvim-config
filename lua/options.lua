---@diagnostic disable: undefined-global
-- Load NvChad default options first
require "nvchad.options"

-- Enhanced Neovim options for better development experience
local opt = vim.opt
local g = vim.g

-- Editor behavior
opt.relativenumber = true -- Relative line numbers for easier navigation
opt.cursorline = true -- Highlight current line
opt.cursorlineopt = "both" -- Highlight both line number and text
opt.scrolloff = 8 -- Keep 8 lines above/below cursor when scrolling
opt.sidescrolloff = 8 -- Keep 8 columns left/right of cursor when scrolling

-- Search behavior
opt.ignorecase = true -- Ignore case in search patterns
opt.smartcase = true -- Override ignorecase if search contains uppercase
opt.inccommand = "split" -- Show live preview of substitutions

-- Text editing
opt.wrap = false -- Disable line wrapping
opt.linebreak = true -- Break lines at word boundaries when wrap is on
opt.textwidth = 80 -- Set text width for formatting

-- File handling
opt.swapfile = false -- Disable swap files
opt.backup = false -- Disable backup files
opt.undofile = true -- Enable persistent undo
opt.undolevels = 10000 -- More undo levels

-- Performance
opt.updatetime = 250 -- Faster completion and better user experience
opt.timeoutlen = 300 -- Time to wait for mapped sequence to complete

-- UI improvements
opt.signcolumn = "yes" -- Always show sign column to prevent layout shift
opt.fillchars = {
  eob = " ", -- Remove ~ from end of buffer
  fold = " ",
  foldopen = "▾",
  foldsep = " ",
  foldclose = "▸",
}

-- Global variables for plugin behavior
g.disable_autoformat = false -- Global toggle for autoformatting
