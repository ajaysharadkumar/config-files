return {
  -- Core LSP Support
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-nvim-lsp",
      "L3MON4D3/LuaSnip",
    },
    config = function()
      -- Mason setup
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "pyright",
          "lua_ls",
          "html",
          "cssls",
          "vtsls", -- preferred for TypeScript/JavaScript
          "eslint",
        },
        automatic_installation = true,
      })

      -- LSP capabilities
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- General handler
      require("mason-lspconfig").setup_handlers({
        function(server_name)
          require("lspconfig")[server_name].setup({
            capabilities = capabilities,
          })
        end,

        -- ESLint special config
        ["eslint"] = function()
          require("lspconfig").eslint.setup({
            capabilities = capabilities,
            settings = {
              format = { enable = true },
            },
            on_attach = function(_, bufnr)
              vim.api.nvim_create_autocmd("BufWritePre", {
                buffer = bufnr,
                command = "EslintFixAll",
              })
            end,
          })
        end,
      })
    end,
  },

  -- Autocompletion core
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        mapping = cmp.mapping.preset.insert({
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = {
          { name = "nvim_lsp" },
        },
      })
    end,
  },

  -- Snippet engine
  { "L3MON4D3/LuaSnip", event = "InsertEnter" },

  {
    "folke/lsp-colors.nvim",
    event = "BufRead",
  },
  
  {
    "xiyaowong/transparent.nvim", -- Optional for toggling background transparency
    cmd = "TransparentToggle",
  }
}