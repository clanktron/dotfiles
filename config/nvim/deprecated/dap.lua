return {
    {
        -- debugging
        'mfussenegger/nvim-dap',
        lazy = true,
        enabled = false,
        dependencies = {
            {'rcarriga/nvim-dap-ui'},
            {'theHamsta/nvim-dap-virtual-text'},
        },
        opts = {
            controls = {
              element = "repl",
              enabled = true,
              icons = {
                disconnect = "",
                pause = "",
                play = "",
                run_last = "",
                step_back = "",
                step_into = "",
                step_out = "",
                step_over = "",
                terminate = ""
              }
            },
            layouts = {
                {
                    elements = {
                        { id = "scopes", size = 0.25 },
                        { id = "breakpoints", size = 0.25 },
                        { id = "stacks", size = 0.25 },
                        { id = "watches", size = 0.25 }
                    },
                    position = "left",
                    size = 40
                },
                {
                    elements = {
                        { id = "console" },
                    },
                    size = 7,
                    position = "bottom",
                }
            },
        },
        config = function(_, opts)
            local dap = require("dap")
            local dapui = require("dapui")
            local daptext = require("nvim-dap-virtual-text")

            daptext.setup()
            dapui.setup(opts)

            -- new highlight groups for debugging symbols
            vim.api.nvim_set_hl(0, 'DapBreakpoint', { ctermbg = 0, fg = '#993939', bg = '#31353f' })
            vim.api.nvim_set_hl(0, 'DapLogPoint', { ctermbg = 0, fg = '#61afef', bg = '#31353f' })
            vim.api.nvim_set_hl(0, 'DapStopped', { ctermbg = 0, fg = '#98c379', bg = '#31353f' })

            vim.fn.sign_define('DapBreakpoint', { text='', texthl='DapBreakpoint', linehl='', numhl='' })
            vim.fn.sign_define('DapBreakpointCondition', { text='ﳁ', texthl='DapBreakpoint', linehl='DapBreakpoint', numhl='DapBreakpoint' })
            vim.fn.sign_define('DapBreakpointRejected', { text='', texthl='DapBreakpoint', linehl='DapBreakpoint', numhl= 'DapBreakpoint' })
            vim.fn.sign_define('DapLogPoint', { text='', texthl='DapLogPoint', linehl='DapLogPoint', numhl= 'DapLogPoint' })
            vim.fn.sign_define('DapStopped', { text='', texthl='DapStopped', linehl='DapStopped', numhl= 'DapStopped' })

            dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
            dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
            dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end

            -- vim.keymap.set('n', "<F6>", function() dapui.toggle(1) end)
            -- vim.keymap.set('n', "<F5>", function() dapui.toggle(2) end)
            -- vim.keymap.set('n', "<Up>", function() dap.continue() end)
            -- vim.keymap.set('n', "<Down>", function() dap.step_over() end)
            -- vim.keymap.set('n', "<Right>", function() dap.step_into() end)
            -- vim.keymap.set('n', "<Left>", function() dap.step_out() end)
            -- vim.keymap.set('n', "<Leader>b", function() dap.toggle_breakpoint() end)
            -- vim.keymap.set('n', "<Leader>B", function() dap.set_breakpoint(vim.fn.input('Breakpoint condition: ')) end)
            -- vim.keymap.set('n', "<Leader>l", function() dap.set_breakpoint(nil, nil, vim.fn.input('Log Message: ')) end)
            -- vim.keymap.set('n', "<leader>rc", function() dap.run_to_cursor() end)
        end
    }
}

