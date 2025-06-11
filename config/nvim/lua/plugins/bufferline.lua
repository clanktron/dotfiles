return {
    'akinsho/bufferline.nvim',
    lazy = false,
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
        options = {
            mode = "tabs", -- Only show tabs, not buffers
            show_buffer_close_icons = false,
            show_close_icon = false,
            separator_style = "thin",
            always_show_bufferline = false, -- Hide when only one tab
            themable = true,
            numbers = function(opts)
                return string.format("%s", opts.ordinal) -- Show tab index
            end,
            tab_size = 18,
            color_icons = true,
        },
    },
    config = function(_, opts)
        require("bufferline").setup(opts)
        vim.cmd.colorscheme('tokyonight')
    end
}
