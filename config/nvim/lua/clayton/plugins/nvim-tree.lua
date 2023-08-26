return {
    {
        'nvim-tree/nvim-tree.lua',
        dependencies = {
            'kyazdani42/nvim-web-devicons',
        },
        opts = {
            view = {
                width = 45,
            }
        },
        config = function ()
            -- disable netrw at the very start of your init.lua (strongly advised)
            vim.g.loaded_netrw = 1
            vim.g.loaded_netrwPlugin = 1
            -- open directory
            vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR> <Cmd>set relativenumber<CR>")
        end,
    },
}
