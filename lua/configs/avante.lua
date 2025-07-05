---@type avante.Config
-- Avante.nvim configuration for AI-powered code assistance
-- Providers: Copilot (default/free) -> OpenRouter (fallback) -> Claude (premium)
local M = {
  -- Primary provider: GitHub Copilot (free with GitHub account)
  provider = "copilot",
  
  -- Enable dual boost for multiple provider responses (disabled for stability)
  dual_boost = {
    enabled = false,
    first_provider = "copilot",
    second_provider = "openrouter",
    prompt = "Based on the two AI responses below, please give me a better solution. Be brief and to the point.",
    timeout = 60000, -- 60 seconds
  },

  -- Provider configurations
  providers = {
    -- GitHub Copilot (Free with GitHub account)
    -- Uses built-in copilot provider with custom model
    copilot = {
      model = "claude-3.5-sonnet",
      extra_request_body = {
        temperature = 0,
        max_tokens = 4096,
      },
    },

    -- OpenRouter (Free tier available)
    -- Inherits from OpenAI provider for compatibility
    openrouter = {
      __inherited_from = "openai",
      endpoint = "https://openrouter.ai/api/v1",
      model = "deepseek/deepseek-chat", -- Free model
      api_key_name = "OPENROUTER_API_KEY",
      extra_request_body = {
        temperature = 0.7,
        max_tokens = 4096,
      },
      extra_headers = {
        ["HTTP-Referer"] = "https://github.com/yetone/avante.nvim",
        ["X-Title"] = "Avante.nvim",
      },
    },

    -- Claude (requires API key)
    -- Uses built-in claude provider
    claude = {
      endpoint = "https://api.anthropic.com",
      model = "claude-3-5-sonnet-20241022",
      api_key_name = "ANTHROPIC_API_KEY",
      extra_request_body = {
        temperature = 0.75,
        max_tokens = 4096,
      },
    },
  },

  -- Behaviour settings
  behaviour = {
    auto_suggestions = false, -- Experimental stage
    auto_set_highlight_group = true,
    auto_set_keymaps = true,
    auto_apply_diff_after_generation = false,
    support_paste_from_clipboard = false,
  },

  -- Key mappings
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

  -- Window settings
  windows = {
    position = "right", -- the position of the sidebar
    wrap = true, -- similar to vim.o.wrap
    width = 30, -- default % based on available width
    sidebar_header = {
      align = "center", -- left, center, right for title
      rounded = true,
    },
  },
}

return M