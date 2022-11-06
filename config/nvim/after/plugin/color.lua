-- general
-- vim.opt.background = 'transparent'

-- tokyonight
require("tokyonight").setup({
  -- your configuration comes here
  -- or leave it empty to use the default settings
  style = "storm", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
  transparent = true, -- Enable this to disable setting the background color
  terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
  styles = {
    -- Background styles. Can be "dark", "transparent" or "normal"
    sidebars = "transparent", -- style for sidebars, see below
    floats = "transparent", -- style for floating windows
  },
})
-- vim.g.tokyonight_transparent_sidebar = true
-- vim.g.tokyonight_transparent = true

-- nightfox (needs to be configured to work with treesitter?)

-- colorscheme
vim.cmd[[colorscheme tokyonight]]
