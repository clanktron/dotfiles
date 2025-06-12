require('commands')
require('keymaps')
require('settings')
require('nestedEsc')
require('session')

-- ensure lazy is installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup(
    {
        { import = "plugins" }
    },
    {
      install = {
        colorscheme = { "tokyonight" },
      },
      checker = {
        enabled = true,
        notify = false,
      },
      change_detection = {
        notify = true,
      },
    }
)

require('lsp')

vim.cmd.colorscheme('tokyonight')
