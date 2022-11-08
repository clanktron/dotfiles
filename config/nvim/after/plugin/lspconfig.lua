-- import lspconfig plugin safely
local lspconfig = require('lspconfig')

-- import cmp-nvim-lsp plugin safely
local cmp_nvim_lsp = require('cmp_nvim_lsp')

local on_attach = function(client, bufnr)
  -- keybind options
  local opts = { noremap = true, silent = true, buffer = bufnr }
  -- set keybinds
  vim.keymap.set('n', 'gf', '<cmd>Lspsaga lsp_finder<CR>', opts) -- show definition, references
  vim.keymap.set('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts) -- got to declaration
  vim.keymap.set('n', 'gd', '<cmd>Lspsaga peek_definition<CR>', opts) -- see definition and make edits in window
  vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts) -- go to implementation
  vim.keymap.set('n', '<leader>ca', '<cmd>Lspsaga code_action<CR>', opts) -- see available code actions
  vim.keymap.set('n', '<leader>rn', '<cmd>Lspsaga rename<CR>', opts) -- smart rename
  vim.keymap.set('n', '<leader>d', '<cmd>Lspsaga show_line_diagnostics<CR>', opts) -- show  diagnostics for line
  vim.keymap.set('n', '<leader>d', '<cmd>Lspsaga show_cursor_diagnostics<CR>', opts) -- show diagnostics for cursor
  vim.keymap.set('n', '[d', '<cmd>Lspsaga diagnostic_jump_prev<CR>', opts) -- jump to previous diagnostic in buffer
  vim.keymap.set('n', ']d', '<cmd>Lspsaga diagnostic_jump_next<CR>', opts) -- jump to next diagnostic in buffer
  vim.keymap.set('n', 'K', '<cmd>Lspsaga hover_doc<CR>', opts) -- show documentation for what is under cursor
  vim.keymap.set('n', '<leader>o', '<cmd>LSoutlineToggle<CR>', opts) -- see outline on right hand side
end

local function config(_config)
	return vim.tbl_deep_extend('force', { on_attach = on_attach	}, _config or {})
end

lspconfig['ansiblels'].setup(config())
-- lspconfig['arduino_langauge_server'].setup(config())
-- lspconfig['asm_lsp'].setup(config())
lspconfig['astro'].setup(config())
lspconfig['bashls'].setup(config())
lspconfig['clangd'].setup(config())
lspconfig['cmake'].setup(config())
lspconfig['cssls'].setup(config())
lspconfig['dockerls'].setup(config())
lspconfig['gopls'].setup(config())
lspconfig['html'].setup(config())
lspconfig['jsonls'].setup(config())
lspconfig['tsserver'].setup(config())
lspconfig['ltex'].setup(config())
lspconfig['marksman'].setup(config())
lspconfig['pyright'].setup(config())
lspconfig['rust_analyzer'].setup(config())
lspconfig['solang'].setup(config())
lspconfig['terraformls'].setup(config())

lspconfig['sumneko_lua'].setup({
  on_attach = on_attach,
  settings = { -- custom settings for lua
    Lua = {
      -- make the language server recognize 'vim' global
      diagnostics = {
        globals = { 'vim' },
      },
      workspace = {
        -- make language server aware of runtime files
        library = {
          [vim.fn.expand('$VIMRUNTIME/lua')] = true,
          [vim.fn.stdpath('config') .. '/lua'] = true,
        },
      },
    },
  },
})
