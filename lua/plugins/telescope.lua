-- This file contains the configuration for the Telescope plugin in Neovim.
return {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = "Telescope",
    keys = {
        { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files" },
        { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
        { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Find buffers" },
        { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help tags" },
    },
    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")

        telescope.setup({
            defaults = {
                borderchars = {
                    prompt = {"─", "│", " ", "│", "╭", "╮", "│", "│"},
                    results = {"─", "│", "─", "│", "├", "┤", "│", "│"},
                    preview = {"─", "│", "─", "│", "╰", "╯", "│", "│"},
                },
                layout_strategy = "horizontal",
                layout_config = {
                    prompt_position = "top",
                },
                sorting_strategy = "ascending",
                winblend = 0,
                mappings = {
                    i = {
                        ["<Esc>"] = actions.close,
                    },
                },
            },
        })
    end,
}