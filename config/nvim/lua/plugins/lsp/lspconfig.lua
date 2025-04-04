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
        'ccls',
        -- 'clangd',
        'cmake',
        'cssls',
        'dockerls',
        'dartls',
        'emmet_language_server',
        'gopls',
        'html',
        'jsonls',
        'java_language_server',
        'lua_ls',
        --'ltex',
        'marksman',
        'ocamllsp',
        'pyright',
        'prolog_ls',
        'rust_analyzer',
        'racket_langserver',
        'terraformls',
        -- 'tsserver',
        'volar', -- vue
    },
    config = function(_, opts)
        local on_attach = function(_, bufnr)
            local options = { noremap = true, silent = true, buffer = bufnr }
            options.desc = "Go to declaration"
            vim.keymap.set("n", "gD", vim.lsp.buf.declaration, options)
            options.desc = "See available code actions"
            vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, options)
            options.desc = "Show line diagnostics"
            vim.keymap.set("n", "gl", vim.diagnostic.open_float, options)
            options.desc = "Smart rename"
            vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, options)
            options.desc = "Go to previous diagnostic"
            vim.keymap.set("n", "[d", function() vim.diagnostic.jump({count=-1, float=true}) end, options)
            options.desc = "Go to next diagnostic"
            vim.keymap.set("n", "]d", function() vim.diagnostic.jump({count=1, float=true}) end, options)
            options.desc = "Show documentation for what is under cursor"
            vim.keymap.set("n", "K", vim.lsp.buf.hover, options)
            options.desc = "Show LSP references"
            vim.keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", options)
            options.desc = "Show LSP definitions"
            vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", options)
            options.desc = "Show LSP implementations"
            vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", options)
            options.desc = "Show LSP type definitions"
            vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", options)
            options.desc = "Show buffer diagnostics"
            vim.keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", options)
            -- non-telescope variants
            -- vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, options)
            -- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, options)
            -- vim.keymap.set('n', 'K', vim.lsp.buf.hover, options)
            -- vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, options)
            -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, options)
            -- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, options)
            -- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, options)
            -- vim.keymap.set('n', '<space>wl', function()
            --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
            -- end, options)
            -- vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, options)
            -- vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, options)
            -- vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, options)
            -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, options)
            -- vim.keymap.set('n', '<space>f', function()
            --   vim.lsp.buf.format { async = true }
            -- end, options)
        end

        local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
        end

        local handlers =  {
          ["textDocument/hover"] =  vim.lsp.buf.hover, { border = "rounded" },
          ["textDocument/signatureHelp"] =  vim.lsp.buf.signature_help, { border = "rounded" },
        }

        local lspconfig = require("lspconfig")
        local capabilities = require("cmp_nvim_lsp").default_capabilities()
        for _, lsp in ipairs(opts) do
            lspconfig[lsp].setup({
                handlers = handlers,
                capabilities = capabilities,
                on_attach = on_attach,
            })
        end

        local mason_registry = require('mason-registry')
        local vue_language_server_path = mason_registry.get_package('vue-language-server'):get_install_path() .. '/node_modules/@vue/language-server'
        lspconfig.ts_ls.setup {
          handlers = handlers,
          capabilities = capabilities,
          on_attach = on_attach,
          init_options = {
            plugins = {
              {
                name = '@vue/typescript-plugin',
                location = vue_language_server_path,
                languages = { 'vue' },
              },
            },
          },
          filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
        }

        lspconfig.volar.setup{
            handlers = handlers,
            capabilities = capabilities,
            on_attach = on_attach,
        }

        lspconfig.java_language_server.setup{
            handlers = handlers,
            capabilities = capabilities,
            on_attach = on_attach,
            filetypes = {'java'},
            cmd = {'java-language-server'},
            root_dir = lspconfig.util.root_pattern('*.java', '.git', 'pom.xml', 'build.gradle')
        }
        lspconfig.helm_ls.setup {
            handlers = handlers,
            capabilities = capabilities,
            on_attach = on_attach,
            filetypes = {'helm'},
            settings = {
              ['helm-ls'] = {
                yamlls = {
                  enabled = false,
                }
              }
            },
            root_dir = lspconfig.util.root_pattern('Chart.yaml', 'values.yaml')
        }
        lspconfig.racket_langserver.setup{
            handlers = handlers,
            capabilities = capabilities,
            on_attach = on_attach,
            root_dir = lspconfig.util.root_pattern('*.rkt', '.git')
        }

        local lua_runtime = vim.split(package.path, ';')
        table.insert(lua_runtime, 'lua/?.lua')
        table.insert(lua_runtime, 'lua/?/init.lua')
        table.insert(lua_runtime, vim.env.VIMRUNTIME)
        table.insert(lua_runtime, vim.env.VIMRUNTIME .. "/lua")
        table.insert(lua_runtime, vim.env.VIMRUNTIME .. "/lua/vim/lsp")
        table.insert(lua_runtime, "${3rd}/luv/library")
        lspconfig.lua_ls.setup({
            handlers = handlers,
            capabilities = capabilities,
            on_attach = on_attach,
            settings = {
                Lua = {
                    runtime = {
                        version = 'LuaJIT',
                        path = {
                            'lua/?.lua',
                            'lua/?/init.lua',
                        },
                    },
                    workspace = {
                        checkThirdParty = false,
                        library = lua_runtime
                    },
                    telemetry = {
                        enable = false,
                    },
                    hint = {
                        enable = true,
                    },
                    },
                },
            })
        end,
}
