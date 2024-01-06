return {
    {
        'nvim-tree/nvim-tree.lua',
        lazy = true,
        dependencies = {
            'kyazdani42/nvim-web-devicons',
        },
        opts = {
            view = {
                width = 35,
            }
        },
        keys = {
            -- { "<leader>e", "<cmd>NvimTreeToggle<cr> <Cmd>set relativenumber<CR>", desc = "Open directory with nvim-tree"},
            { "<leader>e", function() vim.cmd.NvimTreeToggle() vim.opt.relativenumber = true end, desc = "Open directory with nvim-tree"},
        },
        init = function ()
            -- disable netrw at the very start of your init.lua (strongly advised)
            -- vim.g.loaded_netrw = 1
            -- vim.g.loaded_netrwPlugin = 1
        end,
    },
}
