local escape_timer = false

function TerminalEsc()
    if not escape_timer then
        escape_timer = true
        vim.defer_fn(function() escape_timer = false end, 300) -- Reset after 300ms
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", false)
    else
        escape_timer = false
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-\\><C-n>", true, false, true), "n", false)
    end
end

vim.api.nvim_set_keymap("t", "<Esc>", "<Cmd>lua TerminalEsc()<CR>", { noremap = true, silent = true })
