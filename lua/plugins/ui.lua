vim.opt.termguicolors = true
return {

  -- Core UI Plugins
  { "nvim-lualine/lualine.nvim" },              -- Statusline
  { "nvim-tree/nvim-web-devicons" },            -- File icons
  {
    "nvim-treesitter/nvim-treesitter",          -- Better syntax highlighting
    build = ":TSUpdate",
  },

  -- Which-Key: popup help for keybindings
  { "folke/which-key.nvim", event = "VeryLazy", config = true },

  -- Smooth scrolling
  { "karb94/neoscroll.nvim", config = true },

  -- Better notifications
  {
    "rcarriga/nvim-notify",
    config = function()
      vim.notify = require("notify")
    end,
  },

  -- Auto pairs
  { "windwp/nvim-autopairs", event = "InsertEnter", config = true },

  -- Comment toggling
  { "numToStr/Comment.nvim", lazy = false, config = true },

  -- Indent guides
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
  },

  -- Surround motions (e.g. change " to ( )
  { "kylechui/nvim-surround", version = "*", event = "VeryLazy", config = true },

  -- Color scheme: Catppuccin
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000, -- load first
    config = function()
      require("catppuccin").setup({
        flavour = "mocha", -- latte, frappe, macchiato, mocha
        transparent_background = true,
        integrations = {
          cmp = true,
          gitsigns = true,
          nvimtree = true,
          treesitter = true,
          telescope = true,
          notify = true,
          mini = true,
          dashboard = true,
        },
      })
      vim.cmd.colorscheme("catppuccin")
    end,
  },

  -- Statusline: Lualine
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          theme = "catppuccin",
          component_separators = "|",
          section_separators = "",
        },
      })
    end,
  },

  -- File Explorer: nvim-tree
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons", -- icons
    },
    config = function()
      require("nvim-tree").setup({
        view = {
          width = 30,
          side = "left",
        },
        renderer = {
          highlight_git = true,
          icons = {
            show = {
              file = true,
              folder = true,
              folder_arrow = true,
              git = true,
            },
          },
        },
        filters = {
          dotfiles = false,
        },
        git = {
          enable = true,
          ignore = false,
        },
      })

      -- Optional keymap
      vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
    end,
  },

  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("dashboard").setup({
        theme = "hyper", -- or 'doom' if you prefer
        config = {
          header = {
            "   ███╗   ██╗██╗   ██╗██╗███╗   ███╗",
            "   ████╗  ██║██║   ██║██║████╗ ████║",
            "   ██╔██╗ ██║██║   ██║██║██╔████╔██║",
            "   ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║",
            "   ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║",
            "   ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝",
          },
          center = {
            { icon = "  ", desc = "New File", action = "ene | startinsert", key = "n" },
            { icon = "  ", desc = "Recent Files", action = "Telescope oldfiles", key = "r" },
            { icon = "  ", desc = "Find File", action = "Telescope find_files", key = "f" },
            { icon = "  ", desc = "Last Session", action = "SessionManager load_last_session", key = "l" },
            { icon = "  ", desc = "Quit", action = "qa", key = "q" },
          },
          footer = { " Ready to build. Ready to debug. Ready to ship." },
        },
      })
    end,
  },
  
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("bufferline").setup({
        options = {
          mode = "buffers", -- or "tabs"
          diagnostics = "nvim_lsp",
          separator_style = "slant", -- or "thick", "thin"
          offsets = {
            {
              filetype = "NvimTree",
              text = "File Explorer",
              highlight = "Directory",
              text_align = "left",
            },
          },
        },
      })
      vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>", { desc = "Next buffer" })
      vim.keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { desc = "Previous buffer" })
    end,
  },
  
  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
    opts = {},
  },
  
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    config = function()
      require("noice").setup({})
    end,
  },
  
}
