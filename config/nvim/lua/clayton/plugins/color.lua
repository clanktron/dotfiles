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
        config = function ()
           vim.cmd.colorscheme('tokyonight')
        end,
    },
    {
        'EdenEast/nightfox.nvim',
    },
    {
        'Tsuzat/NeoSolarized.nvim',
    },
    {
        'Yazeed1s/oh-lucy.nvim',
    },
}
-- TODO: norcalli/nvim-colorizer.lua
