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
                float = {
                    enable = false,
                    open_win_config = {
                        width = 45,
                    },
                }
            },
            renderer = {
              add_trailing = false,
              group_empty = false,
              full_name = false,
              root_folder_label = ":~:s?$?",
            }
        },
        keys = {
            -- { "<leader>e", "<cmd>NvimTreeToggle<cr> <Cmd>set relativenumber<CR>", desc = "Open directory with nvim-tree"},
            { "<leader>e", function() vim.cmd.NvimTreeToggle() vim.opt.relativenumber = true end, desc = "Open directory with nvim-tree"},
        },
    },
}
