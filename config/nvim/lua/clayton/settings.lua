-- settings

-- line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- tabs
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- indentation
vim.opt.autoindent = true
vim.opt.smartindent = true

-- line wrapping
vim.opt.wrap = false

-- search
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- appearance
vim.opt.guicursor = ""
vim.o.termguicolors = true

-- use system clipboard
vim.opt.clipboard:append("unnamedplus")

-- directory navigation
vim.opt.autochdir = true
