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

    -- useful functions for other plugins
    use 'nvim-lua/plenary.nvim'

    -- file explorer
    use 'nvim-tree/nvim-tree.lua'
    use 'kyazdani42/nvim-web-devicons'

    -- statusline
    use 'nvim-lualine/lualine.nvim'

    -- tmux & split window navigation
    use 'christoomey/vim-tmux-navigator'

    -- window maximize/minimize
    use 'szw/vim-maximizer'

    -- treesitter (syntax highlighting)
    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })

    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'saadparwaiz1/cmp_luasnip'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-nvim-lua'},

            -- Snippets
            {'L3MON4D3/LuaSnip'},
            {'rafamadriz/friendly-snippets'},
        }
    }

    -- auto closing
    use 'windwp/nvim-autopairs'
    use 'windwp/nvim-ts-autotag'

    -- fuzzy finding
    use {'nvim-telescope/telescope.nvim', tag = '0.1.x'}
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    use 'nvim-telescope/telescope-dap.nvim'

    -- git signs plugin
    use 'lewis6991/gitsigns.nvim'

    -- debugging
    use 'mfussenegger/nvim-dap'
    use 'rcarriga/nvim-dap-ui'
    use 'theHamsta/nvim-dap-virtual-text'

    -- go programming
    use 'ray-x/go.nvim'

    -- code pics
    use 'narutoxy/silicon.lua'

    -- harpoon
    use 'theprimeagen/harpoon'

    -- harpoon
    use 'mbbill/undotree'

    -- Markdown
    use({
        'iamcco/markdown-preview.nvim',
        -- if this func doesn't auto run, run it with :call mkdp#util#install() 
        run = function() vim.fn['mkdp#util#install']() end,
    })

    if packer_bootstrap then
        require('packer').sync()
    end

end)
