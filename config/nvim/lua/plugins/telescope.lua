return {
    {
        "nvim-telescope/telescope.nvim",
        lazy = true,
        dependencies = {
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
            { "nvim-telescope/telescope-dap.nvim", enabled = false },
            { 'nvim-lua/plenary.nvim' },
        },
        opts = {
            "fzf",
            -- "dap"
        },
        config = function(_, opts)
            local telescope = require("telescope")
            local actions = require("telescope.actions")
            telescope.setup({
                defaults = {
                    border = false,
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

            for _, extension in ipairs(opts) do
                telescope.load_extension(extension)
            end
            vim.keymap.set("n", "grr", "<cmd>Telescope lsp_references<CR>")
            vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>")
            vim.keymap.set("n", "gri", "<cmd>Telescope lsp_implementations<CR>")
            vim.keymap.set("n", "grt", "<cmd>Telescope lsp_type_definitions<CR>")
            vim.keymap.set('n', '<leader>fb', require('telescope.builtin').buffers, {})
        end,
        init = function ()

        end,
        keys = {
            { "<leader>ff", function() require('telescope.builtin').find_files {} end, desc = "Telescope fzf files" },
            { "<leader>fk", function() require('telescope.builtin').keymaps {} end, desc = "Telescope fzf keymaps" },
            { "<leader>fs", function() require('telescope.builtin').live_grep {} end, desc = "Telescope live grep" },
            -- vim.keymap.set('n', '<leader>fc', builtin.grep_string, {})
            -- vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
        },
        cmd = { "Telescope"}
    },
}
