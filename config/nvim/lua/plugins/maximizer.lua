return {
    'szw/vim-maximizer',
    cmd = {
        "MaximizerToggle",
    },
    keys = {
        vim.keymap.set("n", "<leader>m", "<cmd>MaximizerToggle<CR>")
    }
}
