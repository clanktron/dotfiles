-- fast quit and save
vim.keymap.set("n", "<leader>q", "<cmd>q<cr>")
vim.keymap.set("n", "<leader>w", "<cmd>w<cr>")

-- moving selected sections
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- sane pasting
vim.keymap.set('x', '<leader>p', "\"_dP")

-- tab shortcuts
vim.keymap.set("n", "<leader>t", "<cmd>tabnew<cr>")
vim.keymap.set("n", "<leader>l", "<Esc>gt")
vim.keymap.set("n", "<leader>h", "<Esc>gT")

-- window splits
vim.keymap.set("n", "<leader>v", "<C-w>v")
vim.keymap.set("n", "<leader>s", "<C-w>s")

-- alternative escape (iPad)
vim.keymap.set("n", "<cmd>.", "<Esc>")

-- code lsp/diagnostic navigation
vim.keymap.set("n", "gD", vim.lsp.buf.declaration)
vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action)
vim.keymap.set("n", "gl", vim.diagnostic.open_float)
