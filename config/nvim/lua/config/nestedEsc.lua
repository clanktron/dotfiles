local fish_escape_timer = false

function FishEscBehavior()
    if not fish_escape_timer then
        fish_escape_timer = true
        vim.defer_fn(function() fish_escape_timer = false end, 300) -- Reset after 300ms
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", false)
    else
        fish_escape_timer = false
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-\\><C-n>", true, false, true), "n", false)
    end
end

vim.api.nvim_set_keymap("t", "<Esc>", "<Cmd>lua FishEscBehavior()<CR>", { noremap = true, silent = true })
