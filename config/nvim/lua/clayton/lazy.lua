-- ensure lazy is installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
    -- TODO: norcalli/nvim-colorizer.lua

    -- Colors
    'folke/tokyonight.nvim',
    'EdenEast/nightfox.nvim',
    'Tsuzat/NeoSolarized.nvim',
    'Yazeed1s/oh-lucy.nvim',

    -- useful functions for other plugins
    'nvim-lua/plenary.nvim',

    -- file explorer
    'nvim-tree/nvim-tree.lua',
    'kyazdani42/nvim-web-devicons',
    {
        "nvim-telescope/telescope-file-browser.nvim",
        dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
    },
    -- statusline
    'nvim-lualine/lualine.nvim',

    -- tmux & split window navigation
    'christoomey/vim-tmux-navigator',

    -- window maximize/minimize
    'szw/vim-maximizer',

    -- treesitter (syntax highlighting)
    { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },

    -- LSP support
    'neovim/nvim-lspconfig',
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    -- LSP's not included in Mason
    'towolf/vim-helm',

    -- Autocompletion
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'saadparwaiz1/cmp_luasnip',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-nvim-lua',

    -- Snippets
    'L3MON4D3/LuaSnip',
    'rafamadriz/friendly-snippets',

    -- LSP-Zero automated setup 
    'VonHeikemen/lsp-zero.nvim',

    -- auto closing
    'windwp/nvim-autopairs',
    'windwp/nvim-ts-autotag',

    -- fuzzy finding
    {'nvim-telescope/telescope.nvim', tag = '0.1.2'},
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    'nvim-telescope/telescope-dap.nvim',

    -- git signs plugin
    'lewis6991/gitsigns.nvim',

    -- debugging
    'mfussenegger/nvim-dap',
    'rcarriga/nvim-dap-ui',
    'theHamsta/nvim-dap-virtual-text',

    -- go programming
    'ray-x/go.nvim',

    -- lightweight vimwiki
    {
        'serenevoid/kiwi.nvim', dependencies = { 'nvim-lua/plenary.nvim' }
    },

    -- code pics
    'narutoxy/silicon.lua',

    -- fancy command line and messages
    {
      "folke/noice.nvim",
      event = "VeryLazy",
      opts = {
        -- add any options here
      },
      dependencies = {
        -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
        "MunifTanjim/nui.nvim",
        -- OPTIONAL:
        --   `nvim-notify` is only needed, if you want to use the notification view.
        --   If not available, we use `mini` as the fallback
        "rcarriga/nvim-notify",
        }
    },
        -- harpoon
    'theprimeagen/harpoon',

    -- harpoon
    'mbbill/undotree',

    -- LaTeX
    'lervag/vimtex',

    -- { -- Markdown
    --     'iamcco/markdown-preview.nvim',
    --     -- if this func doesn't auto run, run it with :call mkdp#util#install() 
    --     config = function() vim.fn['mkdp#util#install']() end,
    -- },

})
