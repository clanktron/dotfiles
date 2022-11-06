require('mason').setup()

require('mason-lspconfig').setup({
    ensure_installed = {
        'ansiblels',
        'arduino_language_server',
        'asm_lsp',
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
        'sumneko_lua',
        'marksman',
        'pyright',
        'rust_analyzer',
        'solang',
        'terraformls',
    }
})
