require("nvchad.configs.lspconfig").defaults()

-- Enhanced server list with Python, Rust, and Go support
local servers = { 
  "html", 
  "cssls", 
  "pyright",          -- Python LSP server
  "rust_analyzer",    -- Rust LSP server  
  "gopls",            -- Go LSP server
  "jsonls",           -- JSON support
  "yamlls",           -- YAML support
}

vim.lsp.enable(servers)

-- Language-specific LSP configurations
-- read :h vim.lsp.config for changing options of lsp servers 
if vim.lsp.config then
  -- Python configuration with enhanced settings
  vim.lsp.config("pyright", {
    settings = {
      python = {
        analysis = {
          autoSearchPaths = true,
          diagnosticMode = "workspace",
          useLibraryCodeForTypes = true,
          typeCheckingMode = "basic",
          autoImportCompletions = true,
        }
      }
    }
  })

  -- Rust configuration with clippy and enhanced features
  vim.lsp.config("rust_analyzer", {
    settings = {
      ["rust-analyzer"] = {
        cargo = {
          allFeatures = true,
          loadOutDirsFromCheck = true,
          runBuildScripts = true,
        },
        checkOnSave = {
          allFeatures = true,
          command = "clippy",
          extraArgs = { "--no-deps" },
        },
        procMacro = {
          enable = true,
        },
        inlayHints = {
          bindingModeHints = {
            enable = false,
          },
          chainingHints = {
            enable = true,
          },
          closingBraceHints = {
            enable = true,
            minLines = 25,
          },
          closureReturnTypeHints = {
            enable = "never",
          },
          lifetimeElisionHints = {
            enable = "never",
            useParameterNames = false,
          },
          maxLength = 25,
          parameterHints = {
            enable = true,
          },
          reborrowHints = {
            enable = "never",
          },
          renderColons = true,
          typeHints = {
            enable = true,
            hideClosureInitialization = false,
            hideNamedConstructor = false,
          },
        },
      }
    }
  })

  -- Go configuration with enhanced gopls settings
  vim.lsp.config("gopls", {
    settings = {
      gopls = {
        gofumpt = true,
        codelenses = {
          gc_details = false,
          generate = true,
          regenerate_cgo = true,
          run_govulncheck = true,
          test = true,
          tidy = true,
          upgrade_dependency = true,
          vendor = true,
        },
        hints = {
          assignVariableTypes = true,
          compositeLiteralFields = true,
          compositeLiteralTypes = true,
          constantValues = true,
          functionTypeParameters = true,
          parameterNames = true,
          rangeVariableTypes = true,
        },
        analyses = {
          fieldalignment = true,
          nilness = true,
          unusedparams = true,
          unusedwrite = true,
          useany = true,
        },
        usePlaceholders = true,
        completeUnimported = true,
        staticcheck = true,
        directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
        semanticTokens = true,
      }
    }
  })

  -- JSON configuration
  vim.lsp.config("jsonls", {
    settings = {
      json = {
        schemas = require('schemastore').json.schemas(),
        validate = { enable = true },
      }
    }
  })
end
