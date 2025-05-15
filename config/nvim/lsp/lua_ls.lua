local lua_runtime = vim.split(package.path, ';')
table.insert(lua_runtime, 'lua/?.lua')
table.insert(lua_runtime, 'lua/?/init.lua')
table.insert(lua_runtime, vim.env.VIMRUNTIME)
table.insert(lua_runtime, vim.env.VIMRUNTIME .. "/lua")
table.insert(lua_runtime, vim.env.VIMRUNTIME .. "/lua/vim/lsp")
table.insert(lua_runtime, "${3rd}/luv/library")
return {
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
