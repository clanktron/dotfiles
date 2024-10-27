return {
    {
        "williamboman/mason.nvim",
        dependencies = {
          "williamboman/mason-lspconfig.nvim",
        },
        lazy = true,
        cmd = {"Mason", "MasonInstall", "MasonUninstall", "MasonLog", "MasonUninstallAll", "MasonUpdate"},
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
                },
                -- auto-install configured servers (with lspconfig)
                automatic_installation = false,
            })
        end,
     },
 }
