vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local keymap = vim.keymap

-- General
-- keymap.set("n", "<leader>pv", "<cmd>Ex<CR>", { desc = "Open Netrw"}) -- disabled by nvim-tree
keymap.set("n", "<leader>pv", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle Nvim-Tree"})

-- Splitting windows
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "(Split Vertical) Split window vertical"})
keymap.set("n", "<leader>ss", "<C-w>v", { desc = "(Split Standard) Split window vertical"})
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "(Split Horizontal) Split window horizontal"})
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "(Split X) Close current split"})

-- Managing tabs
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "(Tab Open) Open new tab"})
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "(Tab X) Close current tab"})
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "(Tab Next) Go to next tab"})
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "(Tab Previous) Go to previous tab"})
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "(Tab File) Open current file in new tab"})
