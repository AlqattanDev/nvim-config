---@type avante.Config
-- Avante.nvim configuration for AI-powered code assistance
local M = {
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
}

return M