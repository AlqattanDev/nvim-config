-- Load NvChad default mappings first
require "nvchad.mappings"

-- Enhanced key mappings with better organization and error handling
local map = vim.keymap.set

-- Core editor mappings
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>", { desc = "Exit insert mode" })

-- Disable format on save toggle
map("n", "<leader>uf", function()
  vim.g.disable_autoformat = not vim.g.disable_autoformat
  vim.notify(
    string.format("Autoformat %s", vim.g.disable_autoformat and "disabled" or "enabled"),
    vim.log.levels.INFO
  )
end, { desc = "Toggle autoformat" })

-- Fun and experimental features
map("n", "<leader>fml", function()
  local ok, _ = pcall(vim.cmd, "CellularAutomaton make_it_rain")
  if not ok then
    vim.notify("CellularAutomaton plugin not available", vim.log.levels.WARN)
  end
end, { desc = "Make it rain animation" })

map("n", "<leader>gol", function()
  local ok, _ = pcall(vim.cmd, "CellularAutomaton game_of_life")
  if not ok then
    vim.notify("CellularAutomaton plugin not available", vim.log.levels.WARN)
  end
end, { desc = "Game of life animation" })

-- Git integration (Snacks)
local git_mappings = {
  ["<leader>gB"] = { function() Snacks.gitbrowse() end, "Git Browse" },
  ["<leader>gb"] = { function() Snacks.git.blame_line() end, "Git Blame Line" },
  ["<leader>gf"] = { function() Snacks.lazygit.log_file() end, "Lazygit Current File History" },
  ["<leader>gg"] = { function() Snacks.lazygit() end, "Lazygit" },
  ["<leader>gl"] = { function() Snacks.lazygit.log() end, "Lazygit Log (cwd)" },
}

for key, mapping in pairs(git_mappings) do
  map("n", key, function()
    local ok, err = pcall(mapping[1])
    if not ok then
      vim.notify("Snacks plugin error: " .. tostring(err), vim.log.levels.ERROR)
    end
  end, { desc = mapping[2] })
end

-- Terminal management (Snacks)
local terminal_mappings = {
  ["<leader>tt"] = { function() Snacks.terminal() end, "Toggle Terminal" },
  ["<leader>th"] = { function() Snacks.terminal(nil, { win = { position = "bottom" } }) end, "Terminal Horizontal" },
  ["<leader>tv"] = { function() Snacks.terminal(nil, { win = { position = "right" } }) end, "Terminal Vertical" },
  ["<leader>tf"] = { function() Snacks.terminal(nil, { win = { position = "float" } }) end, "Terminal Float" },
}

for key, mapping in pairs(terminal_mappings) do
  map("n", key, function()
    local ok, err = pcall(mapping[1])
    if not ok then
      vim.notify("Snacks terminal error: " .. tostring(err), vim.log.levels.ERROR)
    end
  end, { desc = mapping[2] })
end

map("t", "<C-/>", "<cmd>close<cr>", { desc = "Hide Terminal" })

-- Quality of life utilities
local utility_mappings = {
  ["<leader>z"] = { function() Snacks.zen() end, "Toggle Zen Mode" },
  ["<leader>un"] = { function() Snacks.notifier.hide() end, "Dismiss All Notifications" },
  ["<leader>N"] = { function() Snacks.notifier.show_history() end, "Notification History" },
  ["<leader>cR"] = { function() Snacks.rename.rename_file() end, "Rename File" },
  ["<leader>ps"] = { function() Snacks.profiler.scratch() end, "Profiler Scratch Buffer" },
  ["<leader>."] = { function() Snacks.scratch() end, "Toggle Scratch Buffer" },
  ["<leader>S"] = { function() Snacks.scratch.select() end, "Select Scratch Buffer" },
}

for key, mapping in pairs(utility_mappings) do
  map("n", key, function()
    local ok, err = pcall(mapping[1])
    if not ok then
      vim.notify("Snacks utility error: " .. tostring(err), vim.log.levels.ERROR)
    end
  end, { desc = mapping[2] })
end

-- Claudia integration mappings
local claudia_mappings = {
  ["<leader>cp"] = { 
    function()
      local ok, config = pcall(require, "configs.claudia")
      if ok then
        config.enhanced_project_selector()
      else
        vim.notify("Claudia plugin not available", vim.log.levels.WARN)
      end
    end, 
    "Claudia: Select Project" 
  },
  ["<leader>cs"] = { 
    function()
      local ok, config = pcall(require, "configs.claudia")
      if ok then
        config.enhanced_session_selector()
      else
        vim.notify("Claudia plugin not available", vim.log.levels.WARN)
      end
    end, 
    "Claudia: Select Session" 
  },
  ["<leader>cv"] = { 
    function()
      local ok, claudia = pcall(require, "claudia")
      if ok then
        claudia.check_claude_version()
      else
        vim.notify("Claudia plugin not available", vim.log.levels.WARN)
      end
    end, 
    "Claudia: Check Claude Version" 
  },
  ["<leader>cm"] = { 
    function()
      local ok, claudia = pcall(require, "claudia")
      if ok then
        claudia.mcp_list()
      else
        vim.notify("Claudia plugin not available", vim.log.levels.WARN)
      end
    end, 
    "Claudia: List MCP Servers" 
  },
}

for key, mapping in pairs(claudia_mappings) do
  map("n", key, mapping[1], { desc = mapping[2] })
end

-- Claudia slash command input
map("n", "<leader>cc", function()
  vim.ui.input({ prompt = "Claudia Command: /" }, function(input)
    if input and input ~= "" then
      local ok, claudia = pcall(require, "claudia")
      if ok then
        claudia.handle_slash_command("/" .. input)
      else
        vim.notify("Claudia plugin not available", vim.log.levels.WARN)
      end
    end
  end)
end, { desc = "Claudia: Execute Slash Command" })

-- File explorer toggle (override NvChad default)
map("n", "<leader>e", function()
  local ok, nvim_tree_api = pcall(require, "nvim-tree.api")
  if ok then
    nvim_tree_api.tree.toggle()
  else
    vim.notify("NvimTree not available", vim.log.levels.WARN)
  end
end, { desc = "Toggle file explorer" })

-- Word navigation
map({ "n", "t" }, "]]", function()
  local ok, err = pcall(function() Snacks.words.jump(vim.v.count1) end)
  if not ok then
    vim.notify("Snacks words navigation error: " .. tostring(err), vim.log.levels.ERROR)
  end
end, { desc = "Next Reference" })

map({ "n", "t" }, "[[", function()
  local ok, err = pcall(function() Snacks.words.jump(-vim.v.count1) end)
  if not ok then
    vim.notify("Snacks words navigation error: " .. tostring(err), vim.log.levels.ERROR)
  end
end, { desc = "Prev Reference" })
