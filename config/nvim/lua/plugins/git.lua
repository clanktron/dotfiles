return {
    {
        'tpope/vim-fugitive',
        lazy = false,
    },
    {
        'lewis6991/gitsigns.nvim',
        lazy = true,
        event = "BufReadPre",
        config = true,
    }
}
