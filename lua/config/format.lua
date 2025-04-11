local conform = require("conform")

conform.setup({
  format_on_save = function(bufnr)
    local ignore_filetypes = { "sql" }
    local ft = vim.bo[bufnr].filetype
    return not vim.tbl_contains(ignore_filetypes, ft)
  end,

  formatters_by_ft = {
    lua = { "stylua" },
    python = { "black" },
    javascript = { "prettier" },
    typescript = { "prettier" },
    typescriptreact = { "prettier" },
    javascriptreact = { "prettier" },
    html = { "prettier" },
    css = { "prettier" },
    json = { "prettier" },
    yaml = { "prettier" },
    markdown = { "prettier" },
    sh = { "shfmt" },
  },

  formatters = {
    injected = { options = { ignore_errors = true } },
  },
})
