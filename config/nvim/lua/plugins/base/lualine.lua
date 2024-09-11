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
        disabled_filetypes = {
          statusline = "",
        },
        sections = {
          lualine_a = {'mode'},
          lualine_b = {'branch', 'diff', 'diagnostics'},
          lualine_c = {'filename'},
          lualine_x = {'encoding', 'filetype'},
          lualine_y = {},
          lualine_z = {}
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = {'filename'},
          lualine_y = {},
          lualine_z = {}
        },
    },
}
