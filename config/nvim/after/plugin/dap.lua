local dap = require("dap")
local dapui = require("dapui")
local daptext = require("nvim-dap-virtual-text")

daptext.setup()

dapui.setup({
    layouts = {
        {
            elements = {
                "console",
            },
            size = 7,
            position = "bottom",
        },
        {
            elements = {
                -- Elements can be strings or table with id and size keys.
                { id = "scopes", size = 0.25 },
                "watches",
            },
            size = 40,
            position = "left",
        }
    },
})

dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open(1) end
dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end

vim.keymap.set('n', "<Home>", function()
    dapui.toggle(1)
end)

vim.keymap.set('n', "<End>", function()
    dapui.toggle(2)
end)

--vim.keymap.set("<leader><leader>", function()
--    dap.close()
--end)

-- vim.keymap.set("<Up>", function()
--     dap.continue()
-- end)
-- 
-- vim.keymap.set("<Down>", function()
--     dap.step_over()
-- end)
-- 
-- vim.keymap.set("<Right>", function()
--     dap.step_into()
-- end)
-- 
-- vim.keymap.set("<Left>", function()
--     dap.step_out()
-- end)
-- 
-- vim.keymap.set("<Leader>b", function()
--     dap.toggle_breakpoint()
-- end)
-- 
-- vim.keymap.set("<Leader>B", function()
--     dap.set_breakpoint(vim.fn.input('Breakpoint condition: '))
-- end)
-- 
-- vim.keymap.set("<leader>rc", function()
--     dap.run_to_cursor()
-- end)
