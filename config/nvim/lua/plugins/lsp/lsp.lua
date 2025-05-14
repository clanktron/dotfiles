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
            local mason = require("mason")
            local mason_lspconfig = require("mason-lspconfig")
            local lspconfig = require("lspconfig")

            vim.api.nvim_create_autocmd("InsertCharPre", {
              pattern = "*",
              callback = function()
                local char = vim.v.char
                if char == '(' or char == ',' then
                  vim.defer_fn(function()
                    vim.lsp.buf.signature_help()
                  end, 0)
                end
              end
            })

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
                options.desc = "Go to previous diagnostic"
                vim.keymap.set("n", "[d", function() vim.diagnostic.jump({count=-1, float=true}) end, options)
                options.desc = "Go to next diagnostic"
                vim.keymap.set("n", "]d", function() vim.diagnostic.jump({count=1, float=true}) end, options)
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

            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            vim.lsp.config('*', {
                capabilities = capabilities,
                on_attach = on_attach,
            })

            vim.lsp.config.helm_ls = {
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

            local lua_runtime = vim.split(package.path, ';')
            table.insert(lua_runtime, 'lua/?.lua')
            table.insert(lua_runtime, 'lua/?/init.lua')
            table.insert(lua_runtime, vim.env.VIMRUNTIME)
            table.insert(lua_runtime, vim.env.VIMRUNTIME .. "/lua")
            table.insert(lua_runtime, vim.env.VIMRUNTIME .. "/lua/vim/lsp")
            table.insert(lua_runtime, "${3rd}/luv/library")

            vim.lsp.config.lua_ls = {
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
            }

            vim.lsp.config.volar = {
              init_options = {
                vue = {
                  hybridMode = false,
                },
                -- NOTE: This might not be needed. Uncomment if you encounter issues.
                -- typescript = {
                --   tsdk = vim.fn.getcwd() .. "/node_modules/typescript/lib",
                -- },
              },
            }
            local mason_packages = vim.fn.stdpath("data") .. "/mason/packages"
            local volar_path = mason_packages .. "/vue-language-server/node_modules/@vue/language-server"
            vim.lsp.config.ts_ls = {
              setup = {
                -- NOTE: To enable Hybrid Mode, change hybrideMode to true above and uncomment the following filetypes block.
                -- WARN: THIS MAY CAUSE HIGHLIGHTING ISSUES WITHIN THE TEMPLATE SCOPE WHEN TSSERVER ATTACHES TO VUE FILES
                -- filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
                init_options = {
                  plugins = {
                    {
                      name = "@vue/typescript-plugin",
                      location = volar_path,
                      languages = { "vue" },
                    },
                  },
                },
              }
            }
            mason.setup()
            mason_lspconfig.setup()
        end,
     }
 }
