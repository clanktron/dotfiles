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
        end,
        keys = {
            { "<leader>grr", function() require('telescope.builtin').lsp_references {} end },
            { "<leader>gd", function() require('telescope.builtin').lsp_definitions {} end },
            { "<leader>gri", function() require('telescope.builtin').lsp_implementations {} end },
            { "<leader>grt", function() require('telescope.builtin').lsp_type_definitions {} end },
            { "<leader>ff", function() require('telescope.builtin').find_files {} end },
            { "<leader>fk", function() require('telescope.builtin').keymaps {} end },
            { "<leader>fs", function() require('telescope.builtin').live_grep {} end },
            { "<leader>fb", function() require('telescope.builtin').buffers {} end },
            { "<leader>ft", function()
                local builtin = require("telescope.builtin")
                local state = require("telescope.actions.state")
                local actions = require("telescope.actions")
                local action_set = require("telescope.actions.set")
                local pickers = require("telescope.pickers")
                local finders = require("telescope.finders")
                local conf = require("telescope.config").values
                local entry_display = require("telescope.pickers.entry_display")
                local Path = require("plenary.path")
            
                local bufs = vim.tbl_filter(function(bufnr)
                    return vim.api.nvim_buf_is_loaded(bufnr)
                        and vim.bo[bufnr].buftype == "terminal"
                        and vim.api.nvim_buf_get_name(bufnr) ~= ""
                end, vim.api.nvim_list_bufs())
            
                local displayer = entry_display.create({
                    separator = " ",
                    items = {
                        { width = 4 }, -- buffer number
                        { width = 2 }, -- flags
                        { remaining = true },
                    },
                })
            
                local make_display = function(entry)
                    local bufnr = entry.bufnr
                    local flags = (vim.bo[bufnr].modified and "+") or " "
                    local process_name = entry.process_name
            
                    return displayer({
                        { tostring(bufnr), "TelescopeResultsNumber" },
                        { flags, "TelescopeResultsComment" },
                        process_name,
                    })
                end
            
                local entries = {}
                for _, bufnr in ipairs(bufs) do
                    local name = vim.api.nvim_buf_get_name(bufnr)
                    local process_name = "[unknown]"
                    
                    -- improved extraction
                    process_name = name:match("term://.-//%d+:(.-):%d+$") or name:match("term://.-//%d+:(.+)$") or "[unknown]"
            
                    table.insert(entries, {
                        value = bufnr,
                        bufnr = bufnr,
                        ordinal = process_name,
                        display = make_display,
                        process_name = process_name,
                    })
                end
            
                pickers.new({}, {
                    prompt_title = "Terminal Buffers",
                    finder = finders.new_table {
                        results = entries,
                        entry_maker = function(entry)
                            return entry
                        end,
                    },
                    sorter = conf.generic_sorter({}),
                    attach_mappings = function(prompt_bufnr, map)
                        actions.select_default:replace(function()
                            local selection = state.get_selected_entry()
                            actions.close(prompt_bufnr)
                            if selection and selection.bufnr then
                                vim.api.nvim_set_current_buf(selection.bufnr)
                            end
                        end)
                        return true
                    end,
                }):find()
            end },
        },
        cmd = { "Telescope"}
    },
}
