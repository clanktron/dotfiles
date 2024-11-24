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

-- persistent undos
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- search
-- vim.opt.hlsearch = false
vim.opt.incsearch = true

-- appearance
vim.opt.guicursor = ""
vim.o.termguicolors = true

-- use system clipboard
vim.opt.clipboard:append("unnamedplus")

-- conceal
vim.opt.conceallevel = 2

-- diagnostics
vim.diagnostic.config({
  float = {
    border = 'rounded',
  },
})
