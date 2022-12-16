-- set custom leader key
vim.g.mapleader = " "

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
vim.keymap.set("n", "<leader>h", "<C-w>s")

-- no more case sensitive saves
vim.keymap.set("n", ":W", ":w")
vim.keymap.set("n", ":Wq", ":wq")

-- open directory
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR> <Cmd>set relativenumber<CR>")
-- keymap.set("n", "<leader>e", "<Esc>:E.<CR>")

-- fast quit and save
vim.keymap.set("n", "<leader>q", "<Esc>:q<CR>")
vim.keymap.set("n", "<leader>w", "<Esc>:w<CR>")

-- telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fk', builtin.keymaps, {})
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
local dap = require('dap')
local dapui = require('dapui')

vim.keymap.set('n', "<F5>", function()
    dapui.toggle(1)
end)

vim.keymap.set('n', "<F6>", function()
    dapui.toggle(2)
end)

vim.keymap.set('n', "F6", function()
    dap.close()
end)

vim.keymap.set('n', "<Up>", function()
    dap.continue()
end)

vim.keymap.set('n', "<Down>", function()
    dap.step_over()
end)

vim.keymap.set('n', "<Right>", function()
    dap.step_into()
end)

vim.keymap.set('n', "<Left>", function()
    dap.step_out()
end)

vim.keymap.set('n', "<Leader>b", function()
    dap.toggle_breakpoint()
end)

vim.keymap.set('n', "<Leader>B", function()
    dap.set_breakpoint(vim.fn.input('Breakpoint condition: '))
end)

vim.keymap.set('n', "<leader>rc", function()
    dap.run_to_cursor()
end)
