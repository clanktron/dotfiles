return {
    {
        'folke/tokyonight.nvim',
        lazy = false,
        priority = 100,
        opts = {
            style = "storm",
            transparent = true,
            terminal_colors = true,
            styles = {
                sidebars = "transparent",
                floats = "transparent",
            }
        },
        config = function(_, opts)
            require("tokyonight").setup(opts)
            vim.cmd.colorscheme('tokyonight')
        end,
    },
    {
        'EdenEast/nightfox.nvim',
        lazy = true,
    },
    {
        'Tsuzat/NeoSolarized.nvim',
        lazy = true,
    },
    {
        'Yazeed1s/oh-lucy.nvim',
        lazy = true,
    },
}
-- TODO: norcalli/nvim-colorizer.lua
