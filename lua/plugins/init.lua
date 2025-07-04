---@type LazySpec
-- Main plugin specification entry point
-- Imports all plugin modules for organized configuration management

return {
  -- Import plugin modules
  { import = "plugins.core" },
  { import = "plugins.ui" },
  { import = "plugins.dev" },
  { import = "plugins.ai" },
}