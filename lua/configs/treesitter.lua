---@type TSConfig
-- Treesitter configuration for enhanced syntax highlighting and parsing
local options = {
  -- Essential parsers for target languages plus common ones
  ensure_installed = {
    -- Base languages (from NvChad defaults)
    "lua", "luadoc", "printf", "vim", "vimdoc",
    
    -- Target languages - PRIMARY FOCUS
    "python", "rust", "go", "gomod", "gowork", "gosum",
    
    -- Additional useful parsers for development
    "json", "yaml", "toml", "markdown", "markdown_inline",
    "bash", "dockerfile", "gitignore", "sql", "regex",
    
    -- Web development support
    "html", "css", "javascript", "typescript", "tsx",
    
    -- Configuration files
    "ini", "properties", "xml",
  },

  -- Enhanced highlighting
  highlight = {
    enable = true,
    use_languagetree = true,
    -- Disable for files larger than 100kb for performance
    disable = function(_, buf)
      local max_filesize = 100 * 1024 -- 100 KB
      local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
      if ok and stats and stats.size > max_filesize then
        return true
      end
    end,
  },

  -- Smart indentation
  indent = { 
    enable = true,
    -- Disable for languages with known indentation issues
    disable = { "python", "yaml" },
  },

  -- Incremental selection for easier code navigation
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<C-space>",
      node_incremental = "<C-space>",
      scope_incremental = false,
      node_decremental = "<bs>",
    },
  },

  -- Text objects for better code manipulation
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj
      keymaps = {
        -- Functions
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        -- Classes/structs
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
        -- Parameters/arguments
        ["aa"] = "@parameter.outer",
        ["ia"] = "@parameter.inner",
        -- Blocks
        ["ab"] = "@block.outer",
        ["ib"] = "@block.inner",
        -- Conditionals
        ["ai"] = "@conditional.outer",
        ["ii"] = "@conditional.inner",
        -- Loops
        ["al"] = "@loop.outer",
        ["il"] = "@loop.inner",
      },
    },
    move = {
      enable = true,
      set_jumps = true,
      goto_next_start = {
        ["]f"] = "@function.outer",
        ["]c"] = "@class.outer",
        ["]a"] = "@parameter.inner",
      },
      goto_next_end = {
        ["]F"] = "@function.outer",
        ["]C"] = "@class.outer",
        ["]A"] = "@parameter.inner",
      },
      goto_previous_start = {
        ["[f"] = "@function.outer",
        ["[c"] = "@class.outer",
        ["[a"] = "@parameter.inner",
      },
      goto_previous_end = {
        ["[F"] = "@function.outer",
        ["[C"] = "@class.outer",
        ["[A"] = "@parameter.inner",
      },
    },
    swap = {
      enable = true,
      swap_next = {
        ["<leader>a"] = "@parameter.inner",
      },
      swap_previous = {
        ["<leader>A"] = "@parameter.inner",
      },
    },
  },

  -- Performance optimizations
  auto_install = true,
  sync_install = false,
  ignore_install = {},
  
  -- Additional modules (if available)
  modules = {},
}

return options