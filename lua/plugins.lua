vim.opt.rtp:prepend("~/.local/share/nvim/lazy/lazy.nvim")

require("lazy").setup({
  -- 📦 Import plugin modules
  { import = "plugins.lsp" },
  { import = "plugins.completion" },
  { import = "plugins.formatting" },
  { import = "plugins.ui" },
  { import = "plugins.git" },
  { import = "plugins.dap" },
  { import = "plugins.devtools" },
  { import = "plugins.telescope" },
})
