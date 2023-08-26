return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
    },
    opts = {
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
    },
    config = function(_, opts)
        -- import lspconfig plugin
        local lspconfig = require("lspconfig")
        -- import cmp-nvim-lsp plugin
        local cmp_nvim_lsp = require("cmp_nvim_lsp")

        local keymap = vim.keymap -- for conciseness

        -- enable keybinds only for when lsp server available
        local on_attach = function(_, bufnr)
            -- keybind options
            local options = { noremap = true, silent = true, buffer = bufnr }
            -- set keybinds
            options.desc = "Show LSP references"
            keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", options) -- show definition, references
            options.desc = "Go to declaration"
            keymap.set("n", "gD", vim.lsp.buf.declaration, options) -- go to declaration
            options.desc = "Show LSP definitions"
            keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", options) -- show lsp definitions
            options.desc = "Show LSP implementations"
            keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", options) -- show lsp implementations
            options.desc = "Show LSP type definitions"
            keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", options) -- show lsp type definitions
            options.desc = "See available code actions"
            keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, options) -- see available code actions, in visual mode will apply to selection
            options.desc = "Smart rename"
            keymap.set("n", "<leader>rn", ":IncRename ", options) -- smart rename
            options.desc = "Show buffer diagnostics"
            keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", options) -- show  diagnostics for file
            options.desc = "Show line diagnostics"
            keymap.set("n", "<leader>d", vim.diagnostic.open_float, options) -- show diagnostics for line
            options.desc = "Go to previous diagnostic"
            keymap.set("n", "[d", vim.diagnostic.goto_prev, options) -- jump to previous diagnostic in buffer
            options.desc = "Go to next diagnostic"
            keymap.set("n", "]d", vim.diagnostic.goto_next, options) -- jump to next diagnostic in buffer
            options.desc = "Show documentation for what is under cursor"
            keymap.set("n", "K", vim.lsp.buf.hover, options) -- show documentation for what is under cursor
            options.desc = "Restart LSP"
            keymap.set("n", "<leader>rs", ":LspRestart<CR>", options) -- mapping to restart lsp if necessary

        end

        -- used to enable autocompletion (assign to every lsp server config)
        local capabilities = cmp_nvim_lsp.default_capabilities()

        -- Change the Diagnostic symbols in the sign column (gutter)
        -- (not in youtube nvim video)
        local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
        end

        for _, lsp in ipairs(opts) do
            lspconfig[lsp].setup({
                capabilities = capabilities,
                on_attach = on_attach,
            })
        end

        -- configure lua server (with special settings)
        lspconfig["lua_ls"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = { -- custom settings for lua
            Lua = {
                -- make the language server recognize "vim" global
                diagnostics = {
                    globals = { "vim" },
                },
                workspace = {
                    -- make language server aware of runtime files
                    library = {
                        [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                        [vim.fn.stdpath("config") .. "/lua"] = true,
                    },
                },
            },
        },
    })
end,
}
