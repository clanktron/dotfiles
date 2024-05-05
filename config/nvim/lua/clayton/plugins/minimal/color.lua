return {
    {
        'folke/tokyonight.nvim',
        lazy = true,
        opts = {
            style = "storm",
            transparent = true,
            terminal_colors = true,
            styles = {
                sidebars = "transparent",
                floats = "transparent",
            }
        },
    },
    {
        'EdenEast/nightfox.nvim',
        opts = {
            options = {
                transparent = true,
            }
        },
        lazy = true,
    },
    {
        'Tsuzat/NeoSolarized.nvim',
        opts = {
            transparent = true,
        },
        lazy = true,
    },
}
-- TODO: norcalli/nvim-colorizer.lua
