vim.api.nvim_create_autocmd("FileType", {
   callback = function(args)
      local lang = vim.treesitter.language.get_lang(args.match)
      if lang and vim.treesitter.language.add(lang) then
         vim.treesitter.start()
      end
   end,
})
