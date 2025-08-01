return {
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
        },
        config = function ()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            vim.lsp.config('*', {
                capabilities = capabilities,
            })
        end
    },
    {
        "williamboman/mason.nvim",
        opts = {},
        cmd = { "Mason" }
    },
}
