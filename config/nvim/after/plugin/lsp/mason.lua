local mason_status, mason  = pcall(require, 'mason')
if not cmp_status then
    return
end

local mason_lspconfig_status, mason_lspconfig = pcall(require, 'mason-lspconfig')
if not mason_lspconfig_status then
    return
end

mason.setup()

mason_lspconfig.setup({
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
