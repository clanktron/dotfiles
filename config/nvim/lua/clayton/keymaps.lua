local keymap = vim.keymap

-- set custom leader key
vim.g.mapleader = " "

-- tab shortcuts
keymap.set("n", "<leader>t", "<Esc>:tabnew %<CR>")
keymap.set("n", "<C-k>", "<Esc>gt")
keymap.set("n", "<C-j>", "<Esc>gT")

-- open directory
keymap.set("n", "<leader>e", "<Esc>:E.<CR>")

-- open directory
keymap.set("n", "<leader>q", "<Esc>:q<CR>")
