return {
    'nvim-lualine/lualine.nvim',
    enabled = true,
    opts = {
        options = {
            globalstatus = false,
            ignore_focus = {
                "NvimTree",
                "dapui_watches",
                "dapui_scopes",
                "dapui_console",
                "dapui_stacks",
                "dapui_breakpoints",
            },
        },
    },
}
