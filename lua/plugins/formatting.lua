return {
    {
      "stevearc/conform.nvim",
      event = "BufWritePre",
      config = function()
        require("conform").setup({
          format_on_save = {
            timeout_ms = 500,
            lsp_fallback = true,
          },
          formatters_by_ft = {
            lua = { "stylua" },
            python = { "black" },
            sh = { "shfmt" },
            javascript = { "prettier" },
            typescript = { "prettier" },
            html = { "prettier" },
            css = { "prettier" },
            json = { "prettier" },
            yaml = { "prettier" },
          },
        })
      end,
    },
  }
  