return {
    {
        "nvim-telescope/telescope.nvim",
        config = function ()
            local telescope = require("telescope")
            local actions = require("telescope.actions")
            telescope.setup({
                defaults = {
                    mappings = {
                        i = {
                            ['<C-p>'] = actions.move_selection_previous, -- move to prev result
                            ['<C-n>'] = actions.move_selection_next, -- move to next result
                            ['<C-q>'] = actions.send_selected_to_qflist + actions.open_qflist, -- send selected to quickfixlist
                        },
                    },
                },
                extensions = {
                    fzf = {
                        fuzzy = true,                    -- false will only do exact matching
                        override_generic_sorter = true,  -- override the generic sorter
                        override_file_sorter = true,     -- override the file sorter
                        case_mode = 'smart_case',        -- 'smart_case' or 'ignore_case' or 'respect_case'
                    }
                }
            })
        end,
    },
    {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = 'make',
        config = function()
            local telescope = require("telescope")
            local builtin = require('telescope.builtin')
            telescope.load_extension('fzf')
            vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
            vim.keymap.set('n', '<leader>fk', builtin.keymaps, {})
            vim.keymap.set('n', '<leader>fs', builtin.live_grep, {})
        end,
    },
    {
        "nvim-telescope/telescope-file-browser.nvim",
        config = function()
            local telescope = require("telescope")
            telescope.load_extension('file_browser')
        end,
    },
    {
        "nvim-telescope/telescope-dap.nvim",
        config = function()
            local telescope = require("telescope")
            telescope.load_extension('dap')
        end,
        enabled = false,
    },
}
-- vim.keymap.set('n', '<leader>e', "<cmd>Telescope file_browser<cr>", {})
-- vim.keymap.set('n', '<leader>fc', builtin.grep_string, {})
-- vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
-- vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
