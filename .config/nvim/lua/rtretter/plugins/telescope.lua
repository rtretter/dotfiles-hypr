return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make"},
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")

        telescope.setup({
            defaults = {
                path_display = { "smart" },
                mappings = {
                    i = {
                        ["C-k"] = actions.move_selection_previous,
                        ["C-j"] = actions.move_selection_next,
                    },
                },
            },
        })

        telescope.load_extension("fzf")

        local keymap = vim.keymap

        keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "(Find File) Fuzzy find files" })
        keymap.set("n", "<leader>pf", "<cmd>Telescope find_files<cr>", { desc = "(Project Find) Fuzzy find files" })
        keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "(Find Recent) Fuzzy find recent files" })
        keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "(Find String) Find string via ripgrep" })
        keymap.set("n", "<leader>ps", "<cmd>Telescope live_grep<cr>", { desc = "(Project Search) Find string via ripgrep" })
        keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "(Find Current) Find string under cursor" })
    end
}
