require('CD')
require('case_insensitive')
require('keymaps')
require('nestedEsc')
require('settings')

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

-- show path
vim.api.nvim_create_user_command("Path", "echo expand('%:p')", {})

vim.cmd.colorscheme('tokyonight')
