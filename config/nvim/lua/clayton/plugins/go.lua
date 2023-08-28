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
    end
}
