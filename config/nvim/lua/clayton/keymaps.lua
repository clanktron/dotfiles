-- set custom leader key
vim.g.mapleader = " "

-- moving selected sections
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- stable page browsing
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- really escape
vim.keymap.set({'n','v','i'}, "<Esc>", '<Esc><Esc>')

-- sane pasting
vim.keymap.set('x', '<leader>p', "\"_dP")

-- tab shortcuts
vim.keymap.set("n", "<leader>t", "<Esc>:tabnew<CR>")
vim.keymap.set("n", "<leader>l", "<Esc>gt")
vim.keymap.set("n", "<leader>h", "<Esc>gT")
-- keymap.set("n", "<C-k>", "<Esc>gt")
-- keymap.set("n", "<C-j>", "<Esc>gT")

-- show path
vim.keymap.set("n", ":path", ":echo expand('%:p')")

-- vim-maximizer
vim.keymap.set("n", "<leader>m", ":MaximizerToggle<CR>")

-- window splits
vim.keymap.set("n", "<leader>v", "<C-w>v")
vim.keymap.set("n", "<leader>o", "<C-w>s")

-- no more case sensitive saves
vim.keymap.set("n", ":W", ":w")
vim.keymap.set("n", ":Wq", ":wq")

-- open directory with netrw
-- vim.keymap.set("n", "<leader>e", "<Esc>:E.<CR>")

-- fast quit and save
vim.keymap.set("n", "<leader>q", "<Esc>:q<CR>")
vim.keymap.set("n", "<leader>w", "<Esc>:w<CR>")

-- -- popup navigation
-- vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
-- vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
-- vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
-- vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")
