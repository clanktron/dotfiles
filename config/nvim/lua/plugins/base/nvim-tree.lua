return {
    {
        'nvim-tree/nvim-tree.lua',
        lazy = true,
        dependencies = {
            'nvim-tree/nvim-web-devicons',
        },
        opts = {
            view = {
                width = 35,
                preserve_window_proportions = true,
                signcolumn = "no",
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
              root_folder_label = false
            }
        },
        keys = {
            -- { "<leader>e", "<cmd>NvimTreeToggle<cr> <Cmd>set relativenumber<CR>", desc = "Open directory with nvim-tree"},
            { "<leader>e", function() vim.cmd.NvimTreeToggle() vim.opt.relativenumber = true end, desc = "Open directory with nvim-tree"},
        },
    },
}
