-- Configuration for Claudia nvim-ui plugin
local M = {}

-- Setup Claudia plugin
local claudia = require("claudia")

-- Setup the Claudia plugin with custom configuration
claudia.setup({
  -- Backend path is already configured in the plugin
  -- but can be overridden here if needed
  -- backend_path = "/Users/alialqattan/Clones/claudia/src-tauri/target/release/claudia",
})

-- Omni-completion for slash commands
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "lua", "markdown", "text", "python", "javascript", "typescript" },
  callback = function()
    vim.opt_local.omnifunc = "v:lua.require'claudia'.get_slash_command_suggestions"
  end,
  desc = "Enable Claudia slash command completion",
})

-- Auto-command to refresh statusline when session changes
vim.api.nvim_create_autocmd("User", {
  pattern = "ClaudiaSessionChanged",
  callback = function()
    vim.cmd("redrawstatus")
  end,
  desc = "Refresh statusline when Claudia session changes",
})

-- Enhanced session selection with better error handling
local function enhanced_project_selector()
  local ok, err = pcall(claudia.list_projects)
  if not ok then
    vim.notify("Claudia backend error: " .. tostring(err), vim.log.levels.ERROR)
    vim.notify("Make sure Claudia backend is built and accessible", vim.log.levels.WARN)
  end
end

-- Enhanced session management
local function enhanced_session_selector()
  local active_session = claudia.get_active_session()
  if not active_session then
    vim.notify("No active Claudia session. Select a project first.", vim.log.levels.WARN)
    enhanced_project_selector()
    return
  end
  
  local ok, err = pcall(claudia.get_sessions, active_session)
  if not ok then
    vim.notify("Error getting sessions: " .. tostring(err), vim.log.levels.ERROR)
  end
end

-- Export enhanced functions for use in mappings
M.enhanced_project_selector = enhanced_project_selector
M.enhanced_session_selector = enhanced_session_selector

return M