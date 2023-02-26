vim.opt.signcolumn = 'yes' -- Reserve space for diagnostic icons

local lsp = require('lsp-zero')
lsp.preset('recommended')

lsp.ensure_installed({
    'ansiblels',
    'arduino_language_server',
    -- 'asm_lsp',
    'astro',
    'bashls',
    'clangd',
    'cmake',
    'cssls',
    'dockerls',
    'gopls',
    'html',
    'jsonls',
    'tsserver',
    'ltex',
    'lua_ls',
    'marksman',
    'pyright',
    'rust_analyzer',
    'terraformls',
})

lsp.nvim_workspace()

lsp.setup()
