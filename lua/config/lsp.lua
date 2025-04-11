-- Mason setup for LSP server management
require("mason").setup()

require("mason-lspconfig").setup({
  ensure_installed = {
    "pyright",
    "html",
    "cssls",
    "lua_ls",
    "vtsls",
    "eslint", -- 🔧 Ensure ESLint is managed
  },
  automatic_installation = true,
})

-- Load required modules
local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Setup for all LSP servers, with custom handlers where needed
require("mason-lspconfig").setup_handlers({

  -- Default handler for most LSPs
  function(server_name)
    lspconfig[server_name].setup({
      capabilities = capabilities,
    })
  end,

  -- ✅ ESLint custom configuration
  ["eslint"] = function()
    lspconfig.eslint.setup({
      capabilities = capabilities,
      settings = {
        format = { enable = true },
      },
      on_attach = function(client, bufnr)
        vim.notify("✅ ESLint attached to buffer " .. bufnr, vim.log.levels.INFO)
        vim.api.nvim_create_autocmd("BufWritePre", {
          buffer = bufnr,
          command = "EslintFixAll",
        })
      end,
    })
  end,

  -- ✅ Lua custom config (optional enhancement for Neovim dev)
  ["lua_ls"] = function()
    lspconfig.lua_ls.setup({
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            library = vim.api.nvim_get_runtime_file("", true),
            checkThirdParty = false,
          },
        },
      },
    })
  end,
})
