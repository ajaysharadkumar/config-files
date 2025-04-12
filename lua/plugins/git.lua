return {
  -- Inline Git indicators in the gutter
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end,
  },

  -- Full Git integration via commands
  {
    "tpope/vim-fugitive"
  },

  -- Lazygit integration
  {
    "kdheepak/lazygit.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>gg", "<cmd>LazyGit<CR>", desc = "Open Lazygit" }
    },
    config = function()
      vim.g.lazygit_floating_window_winblend = 0 -- transparency
    end,
  },
}
