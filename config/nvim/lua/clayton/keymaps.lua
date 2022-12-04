-- set custom leader key
vim.g.mapleader = " "

-- tab shortcuts
vim.keymap.set("n", "<leader>t", "<Esc>:tabnew<CR>")
vim.keymap.set("n", "<leader>l", "<Esc>gt")
vim.keymap.set("n", "<leader>h", "<Esc>gT")
-- keymap.set("n", "<C-k>", "<Esc>gt")
-- keymap.set("n", "<C-j>", "<Esc>gT")

-- vim-maximizer
vim.keymap.set("n", "<leader>m", ":MaximizerToggle<CR>")

-- window splits
vim.keymap.set("n", "<leader>v", "<C-w>v")
vim.keymap.set("n", "<leader>o", "<C-w>s")

-- open directory
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")
-- keymap.set("n", "<leader>e", "<Esc>:E.<CR>")

-- fast quit
vim.keymap.set("n", "<leader>q", "<Esc>:q<CR>")

-- telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fs', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fc', builtin.grep_string, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- silicon
local silicon = require('silicon')
-- Generate image of lines in a visual selection
vim.keymap.set('v', '<Leader>s', function() silicon.visualise_api({}) end )
-- Generate image of a whole buffer, with lines in a visual selection highlighted
vim.keymap.set('v', '<Leader>bs', function() silicon.visualise_api({to_clip = true, show_buf = true}) end )
-- Generate visible portion of a buffer
vim.keymap.set('n', '<Leader>s',  function() silicon.visualise_api({to_clip = true, visible = true}) end )
-- Generate current buffer line in normal mode
vim.keymap.set('n', '<Leader>s',  function() silicon.visualise_api({to_clip = true}) end )

-- debugging
--local dap = require('dap')
--local dapui = require('dapui')

