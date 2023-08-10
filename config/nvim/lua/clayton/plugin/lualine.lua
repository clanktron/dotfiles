require('lualine').setup {
    options = {
        --     icons_enabled = true,
        --     theme = 'auto',
        --     component_separators = { left = '', right = ''},
        --     section_separators = { left = '', right = ''},
        --     disabled_filetypes = {
            --       statusline = {},
            --       winbar = {},
            --     },
            ignore_focus = {
                "NvimTree",
                "dapui_watches",
                "dapui_scopes",
                "dapui_console",
                "dapui_stacks",
                "dapui_breakpoints",
            },
            --     always_divide_middle = true,
            --     globalstatus = false,
            --     refresh = {
                --       statusline = 1000,
                --       tabline = 1000,
                --       winbar = 1000,
                --     }
    },
    sections = {
      lualine_x = {
        {
          require("noice").api.statusline.mode.get,
          cond = require("noice").api.statusline.mode.has,
          color = { fg = "#ff9e64" },
        }
      },
      --     lualine_a = {'mode'},
      --     lualine_b = {'branch', 'diff', 'diagnostics'},
      --     lualine_c = {'filename'},
      --     lualine_x = {'encoding', 'fileformat', 'filetype'},
      --     lualine_y = {'progress'},
      --     lualine_z = {'location'}
    },
    --   inactive_sections = {
      --     lualine_a = {},
      --     lualine_b = {},
      --     lualine_c = {'filename'},
      --     lualine_x = {'location'},
      --     lualine_y = {},
      --     lualine_z = {}
    --   },
    --   tabline = {},
    --   winbar = {},
    --   inactive_winbar = {},
    --   extensions = {}
}
