return {
    {
        "williamboman/mason.nvim",
        dependencies = {
          "williamboman/mason-lspconfig.nvim",
        },
        lazy = true,
        cmd = {"Mason", "MasonInstall", "MasonUninstall", "MasonLog", "MasonUninstallAll", "MasonUpdate"},
        -- opts = {
        --     'ansiblels',
        --     'arduino_language_server',
        --     -- 'asm_lsp',
        --     'astro',
        --     'bashls',
        --     'clangd',
        --     'cmake',
        --     'cssls',
        --     'dockerls',
        --     'gopls',
        --     'html',
        --     'jsonls',
        --     'tsserver',
        --     --'ltex',
        --     'lua_ls',
        --     'marksman',
        --     'pyright',
        --     'rust_analyzer',
        --     'terraformls',
        -- },
        config = function()
            -- Reserve space for diagnostic icons
            vim.opt.signcolumn = 'yes'
            local mason = require("mason")
            -- import mason-lspconfig plugin safely
            local mason_lspconfig = require("mason-lspconfig")
            -- enable mason
            mason.setup()
            mason_lspconfig.setup({
                -- list of servers for mason to install
                ensure_installed = {
                  -- 'ansiblels',
                  -- 'arduino_language_server',
                  -- -- 'asm_lsp',
                  -- 'astro',
                  -- 'bashls',
                  -- 'clangd',
                  -- 'cmake',
                  -- 'cssls',
                  -- 'dockerls',
                  -- 'gopls',
                  -- 'html',
                  -- 'jsonls',
                  -- 'tsserver',
                  -- --'ltex',
                  -- 'lua_ls',
                  -- 'marksman',
                  -- 'pyright',
                  -- 'rust_analyzer',
                  -- 'terraformls',
                },
                -- auto-install configured servers (with lspconfig)
                automatic_installation = false,
            })
        end,
     },
     -- {
     --     'towolf/vim-helm',
     --     ft = 'helm',
     --     config = function()
     --         local lsp = require('lspconfig')
     --         local configs = require('lspconfig.configs')
     --         local util = require('lspconfig.util')
     --         if not configs.helm_ls then
     --             configs.helm_ls = {
     --                 default_config = {
     --                     cmd = {"helm_ls", "serve"},
     --                     filetypes = {'helm'},
     --                     root_dir = function(fname)
     --                         return util.root_pattern('Chart.yaml')(fname)
     --                     end,
     --                 },
     --             }
     --         end
     --         lsp.helm_ls.setup {
     --             filetypes = {"helm"},
     --             cmd = {"helm_ls", "serve"},
     --         }
     --     end,
     -- },
 }
