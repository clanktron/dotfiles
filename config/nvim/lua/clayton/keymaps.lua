local keymap = vim.keymap

-- set custom leader key
vim.g.mapleader = " "

-- tab shortcuts
keymap.set("n", "<leader>t", "<Esc>:tabnew<CR>")
keymap.set("n", "<leader>l", "<Esc>gt")
keymap.set("n", "<leader>h", "<Esc>gT")
-- keymap.set("n", "<C-k>", "<Esc>gt")
-- keymap.set("n", "<C-j>", "<Esc>gT")

-- vim-maximizer
keymap.set("n", "<leader>m", ":MaximizerToggle<CR>")

-- window splits
keymap.set("n", "<leader>v", "<C-w>v")
keymap.set("n", "<leader>o", "<C-w>s")

-- open directory
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")
-- keymap.set("n", "<leader>e", "<Esc>:E.<CR>")

-- fast quit
keymap.set("n", "<leader>q", "<Esc>:q<CR>")

-- telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fs', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fc', builtin.grep_string, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
