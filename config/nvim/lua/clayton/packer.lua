-- This file can be loaded by calling `lua require('plugins')` from your init.vim

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  
  -- Colors
  use 'folke/tokyonight.nvim'
  use 'maxmx03/solarized.nvim'

  -- treesitter (syntax highlighting)
  use("nvim-treesitter/nvim-treesitter", {
     run = ":TSUpdate"
  })
  
end)
