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
        vim.keymap.set('n', '<leader>e', function ()
            oil.open(vim.fn.getcwd())
        end)
        vim.keymap.set('n', '-', oil.open)
    end
}
