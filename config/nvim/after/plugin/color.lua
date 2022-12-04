-- tokyonight
require("tokyonight").setup({
  style = "storm",
  transparent = false,
  terminal_colors = true,
  styles = {
    sidebars = "transparent",
    floats = "transparent",
  },
})

-- nightfox (needs to be configured to work with treesitter?)

-- colorscheme
vim.cmd[[colorscheme tokyonight]]
