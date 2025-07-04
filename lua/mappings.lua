require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- Cellular Automaton mappings
map("n", "<leader>fml", "<cmd>CellularAutomaton make_it_rain<CR>", { desc = "Make it rain animation" })
map("n", "<leader>gol", "<cmd>CellularAutomaton game_of_life<CR>", { desc = "Game of life animation" })

-- Snacks mappings (only for enabled modules)
map("n", "<leader>gB", function() Snacks.gitbrowse() end, { desc = "Git Browse" })
map("n", "<leader>gb", function() Snacks.git.blame_line() end, { desc = "Git Blame Line" })
map("n", "<leader>gf", function() Snacks.lazygit.log_file() end, { desc = "Lazygit Current File History" })
map("n", "<leader>gg", function() Snacks.lazygit() end, { desc = "Lazygit" })
map("n", "<leader>gl", function() Snacks.lazygit.log() end, { desc = "Lazygit Log (cwd)" })
map("n", "<leader>un", function() Snacks.notifier.hide() end, { desc = "Dismiss All Notifications" })
map("n", "<leader>z", function() Snacks.zen() end, { desc = "Toggle Zen Mode" })
map({ "n", "t" }, "]]", function() Snacks.words.jump(vim.v.count1) end, { desc = "Next Reference" })
map({ "n", "t" }, "[[", function() Snacks.words.jump(-vim.v.count1) end, { desc = "Prev Reference" })

-- Snacks Terminal mappings (replacing NvChad terminal)
map("n", "<leader>tt", function() Snacks.terminal() end, { desc = "Toggle Terminal" })
map("n", "<leader>th", function() Snacks.terminal(nil, { win = { position = "bottom" } }) end, { desc = "Terminal Horizontal" })
map("n", "<leader>tv", function() Snacks.terminal(nil, { win = { position = "right" } }) end, { desc = "Terminal Vertical" })
map("n", "<leader>tf", function() Snacks.terminal(nil, { win = { position = "float" } }) end, { desc = "Terminal Float" })
map("t", "<C-/>", "<cmd>close<cr>", { desc = "Hide Terminal" })

-- Additional Snacks mappings for new modules
map("n", "<leader>cR", function() Snacks.rename.rename_file() end, { desc = "Rename File" })
map("n", "<leader>N", function() Snacks.notifier.show_history() end, { desc = "Notification History" })
map("n", "<leader>ps", function() Snacks.profiler.scratch() end, { desc = "Profiler Scratch Buffer" })
map("n", "<leader>.", function() Snacks.scratch() end, { desc = "Toggle Scratch Buffer" })
map("n", "<leader>S", function() Snacks.scratch.select() end, { desc = "Select Scratch Buffer" })
