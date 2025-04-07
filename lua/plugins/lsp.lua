return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
          library = {
            -- See the configuration section for more details
            -- Load luvit types when the `vim.uv` word is found
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
      -- Add nvim-java and its dependencies here
      "nvim-java/lua-async-await",
      "nvim-java/nvim-java-core",
      "nvim-java/nvim-java-test",
      "nvim-java/nvim-java-dap",
      "MunifTanjim/nui.nvim",
      "mfussenegger/nvim-dap",
      {
        "williamboman/mason.nvim",
        opts = {
          registries = {
            "github:nvim-java/mason-registry",
            "github:mason-org/mason-registry",
          },
        },
      },
      "williamboman/mason-lspconfig.nvim",
      {
        "nvim-java/nvim-java",
        ft = "java",
      },
    },
    config = function()
      -- Set up Mason
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "tsserver",    -- TypeScript LSP
          "zls",         -- Zig LSP
          "gopls",       -- Go LSP
          -- Add other LSP servers you want installed
        },
      })

      -- Configure lua_ls
      require("lspconfig").lua_ls.setup({})

      -- Configure TypeScript LSP
      require("lspconfig").tsserver.setup({
        -- Optional: Add specific TypeScript LSP settings
        -- For example:
        -- settings = {
        --   typescript = {
        --     inlayHints = {
        --       includeInlayParameterNameHints = "all",
        --       includeInlayParameterNameHintsWhenArgumentMatchesName = false,
        --       includeInlayFunctionParameterTypeHints = true,
        --       includeInlayVariableTypeHints = true,
        --       includeInlayPropertyDeclarationTypeHints = true,
        --       includeInlayFunctionLikeReturnTypeHints = true,
        --       includeInlayEnumMemberValueHints = true,
        --     }
        --   }
        -- }
      })

      -- Configure Zig LSP
      require("lspconfig").zls.setup({
        -- Optional: Add Zig-specific settings
      })

      -- Configure Go LSP
      require("lspconfig").gopls.setup({
        -- Optional: Add Go-specific settings
        -- settings = {
        --   gopls = {
        --     analyses = {
        --       unusedparams = true,
        --     },
        --     staticcheck = true,
        --   },
        -- },
      })

      -- Configure nvim-java
      require("java").setup({
        -- Optional: Configure Java settings
        jdk = {
          path = os.getenv("HOME") .. "/.sdkman/candidates/java", -- Adjust this path
          default_version = "17", -- Or your preferred Java version
        },
        -- LSP configuration
        eclipse = {
          download = {
            url = "https://www.eclipse.org/downloads/download.php?file=/jdtls/snapshots/jdt-language-server-1.29.0-202312071447.tar.gz",
          },
        },
        jdtls = {
          settings = {
            java = {
              format = { enabled = true },
              signatureHelp = { enabled = true },
              completion = {
                favoriteStaticMembers = {
                  "org.junit.Assert.*",
                  "org.junit.Assume.*",
                  "org.junit.jupiter.api.Assertions.*",
                  "org.junit.jupiter.api.Assumptions.*",
                  "org.hamcrest.MatcherAssert.*",
                  "org.hamcrest.Matchers.*",
                },
              },
              sources = {
                organizeImports = {
                  starThreshold = 9999,
                  staticStarThreshold = 9999,
                },
              },
              inlayHints = {
                parameterNames = { enabled = true },
              },
            },
          },
        },
      })
    end,
  },
}
