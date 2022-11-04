-- ensure packer is installed
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer.lua source <afile> | PackerCompile
  augroup end
]])

return require('packer').startup(function(use)
    -- packer manages itself
    use 'wbthomason/packer.nvim'

    -- Colors
    use 'folke/tokyonight.nvim'
    use 'EdenEast/nightfox.nvim'
    use 'Tsuzat/NeoSolarized.nvim'
    use 'Yazeed1s/oh-lucy.nvim'
  
    -- treesitter (syntax highlighting)
    use('nvim-treesitter/nvim-treesitter', {
        run = ":TSUpdate"
    })
  
    -- Markdown
    use({
        "iamcco/markdown-preview.nvim",
        -- if this func doesn't auto run, run it with :call mkdp#util#install() 
        run = function() vim.fn["mkdp#util#install"]() end,
    })
    
    if packer_bootstrap then
      require('packer').sync()
    end

end)
