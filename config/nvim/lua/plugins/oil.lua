return {
    'stevearc/oil.nvim',
    lazy = false,
    config = function ()
        local oil = require('oil')
        oil.setup{
            view_options = {
                show_hidden = true
            }
        }
        vim.keymap.set('n', '<leader>e', oil.open)
        vim.keymap.set('n', '-', oil.open)
    end
}
