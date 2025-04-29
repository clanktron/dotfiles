return {
    {
       "neovim/nvim-lspconfig",
       event = { "BufReadPre", "BufNewFile" },
       dependencies = {
           "hrsh7th/cmp-nvim-lsp",
       },
    },
    {
        "williamboman/mason.nvim",
        dependencies = {
          "williamboman/mason-lspconfig.nvim",
        },
        lazy = false,
        cmd = {"Mason", "MasonInstall", "MasonUninstall", "MasonLog", "MasonUninstallAll", "MasonUpdate"},
        config = function()
            -- Reserve space for diagnostic icons
            vim.opt.signcolumn = 'yes'

            local mason = require("mason")
            local mason_lspconfig = require("mason-lspconfig")
            local lspconfig = require("lspconfig")

            local on_attach = function(_, bufnr)
                local options = {
                    noremap = true,
                    silent = true,
                    buffer = bufnr
                }
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
                vim.keymap.set("n", "grr", "<cmd>Telescope lsp_references<CR>", options)
                options.desc = "Show LSP definitions"
                vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", options)
                options.desc = "Show LSP implementations"
                vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", options)
                options.desc = "Show LSP type definitions"
                vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", options)
                options.desc = "Show buffer diagnostics"
                vim.keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", options)
            end

            vim.diagnostic.config({
                signs = {
                    text = {
                        [vim.diagnostic.severity.ERROR] = "",
                        [vim.diagnostic.severity.WARN] = "",
                        [vim.diagnostic.severity.HINT] = "󰠠",
                        [vim.diagnostic.severity.INFO] = ""
                    }
                }
            })

            local handlers =  {
              ["textDocument/hover"] =  vim.lsp.buf.hover, { border = "rounded" },
              ["textDocument/signatureHelp"] =  vim.lsp.buf.signature_help, { border = "rounded" },
            }
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            local setup_handlers = {
                -- default handler
                function (server_name)
                    require("lspconfig")[server_name].setup {
                        handlers = handlers,
                        capabilities = capabilities,
                        on_attach = on_attach,
                    }
                end,

                ["java_language_server"] = function ()
                    lspconfig.java_language_server.setup{
                        handlers = handlers,
                        capabilities = capabilities,
                        on_attach = on_attach,
                        filetypes = {'java'},
                        cmd = {'java-language-server'},
                        root_dir = lspconfig.util.root_pattern('*.java', '.git', 'pom.xml', 'build.gradle')
                    }
                end,

                ["helm_ls"] = function ()
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
                end,

                ["volar"] = function ()
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
                    lspconfig.volar.setup {
                        handlers = handlers,
                        capabilities = capabilities,
                        on_attach = on_attach,
                    }
                end,

                ["lua_ls"] = function ()
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

            mason.setup()
            mason_lspconfig.setup({
                -- list of servers for mason to install
                ensure_installed = {
                },
                -- auto-install configured servers (with lspconfig)
                automatic_installation = false,

            })

            mason_lspconfig.setup_handlers(setup_handlers)
        end,
     }
 }
