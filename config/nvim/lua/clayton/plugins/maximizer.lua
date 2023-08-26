return {
    'szw/vim-maximizer',
    cmd = {
        "Max", "MaximizerToggle",
    },
    init = function ()
        vim.api.nvim_create_user_command("Max", "MaximizerToggle", {})
    end
    -- keys = {
    --     vim.keymap.set("n", "<leader>m", vim.cmd[[MaximizerToggle]])
    -- }
}
