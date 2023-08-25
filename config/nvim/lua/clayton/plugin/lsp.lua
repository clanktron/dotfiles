local lsp_zero = require('lsp-zero')
local lsp = require('lspconfig')
local configs = require('lspconfig.configs')
local util = require('lspconfig.util')
local cmp = require('cmp')

-- Reserve space for diagnostic icons
vim.opt.signcolumn = 'yes'

lsp_zero.preset('recommended')

lsp_zero.ensure_installed({
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
    --'ltex',
    'lua_ls',
    'marksman',
    'pyright',
    'rust_analyzer',
    'terraformls',
})

lsp_zero.nvim_workspace()

lsp_zero.setup()

-- lsp.ltex.setup({
--     autostart = false,
--     filetypes = {
--         "bib",
--         -- "gitcommit",
--         "org",
--         "plaintex",
--         "rst",
--         "rnoweb",
--         "tex",
--         -- "pandoc",
--         -- "markdown"
--     }
-- })

lsp.lua_ls.setup({
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})

if not configs.helm_ls then
  configs.helm_ls = {
    default_config = {
      cmd = {"helm_ls", "serve"},
      filetypes = {'helm'},
      root_dir = function(fname)
        return util.root_pattern('Chart.yaml')(fname)
      end,
    },
  }
end

lsp.helm_ls.setup {
  filetypes = {"helm"},
  cmd = {"helm_ls", "serve"},
}

-- snippets
-- load from rafamadriz/friendly-snippets
require("luasnip.loaders.from_vscode").lazy_load({
    -- also load custom snippets
    paths = {
        "./snippets"
    }
})

-- cmp setup
-- local cmp_action = require('lsp-zero').cmp_action()
cmp.setup({
  sources = {
    {name = 'nvim_lsp'},
    {name = 'luasnip'},
  },
   -- custom action mapping
   -- mapping = {
   --   ['<C-f>'] = cmp_action.luasnip_jump_forward(),
   --   ['<C-b>'] = cmp_action.luasnip_jump_backward(),
   -- }
})
