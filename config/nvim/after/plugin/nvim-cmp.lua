local cmp = require('cmp')

local luasnip = require('luasnip')

-- load friendly snippets
require('luasnip/loaders/from_vscode').lazy_load()

vim.opt.completeopt = 'menu,menuone,noselect'

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
    ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
    ["<C-e>"] = cmp.mapping.abort(), -- close completion window
    ["<CR>"] = cmp.mapping.confirm({ select = false }),
  }),
   -- sources for autocompletion
   sources = cmp.config.sources({
     { name = "nvim_lsp" }, -- lsp
     { name = "luasnip" }, -- snippets
     { name = "buffer" }, -- text within current buffer
     { name = "path" }, -- file system paths
   }),
   -- configure lspkind for vs-code like icons
   formatting = {
     format = require('lspkind').cmp_format({
       maxwidth = 50,
       ellipsis_char = "...",
     }),
   },
})
