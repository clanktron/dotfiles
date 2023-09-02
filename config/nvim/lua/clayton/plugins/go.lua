return {
    'ray-x/go.nvim',
    ft = {"go", 'gomod'},
    lazy = true,
    dependencies = {
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    event = {"CmdlineEnter"},
    build = function ()
        require("go.install").update_all_sync()
    end,
    config = function ()
        require('go').setup()
        -- Run gofmt + goimport on save
        local format_sync_grp = vim.api.nvim_create_augroup("GoImport", {})
        vim.api.nvim_create_autocmd("BufWritePre", {
          pattern = "*.go",
          callback = function()
           require('go.format').goimport()
          end,
          group = format_sync_grp,
        })
    end
}
