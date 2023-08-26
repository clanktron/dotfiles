return {
    -- lightweight vimwiki
    'serenevoid/kiwi.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
    },
    opts = {
        {
          name = "blog",
          path = os.getenv("BLOG_DIR")
        },
        {
            name = "diary",
            path = os.getenv("DIARY_DIR")
        },
        {
          name = "wiki",
          path = os.getenv("WIKI")
        }
    },
    config = function()
        local kiwi = require("kiwi")
        -- Necessary keybindings
        vim.keymap.set('n', '<leader>kw', kiwi.open_wiki_index, {})
        vim.keymap.set('n', '<leader>kd', kiwi.open_diary_index, {})
        vim.keymap.set('n', '<leader>kn', kiwi.open_diary_new, {})
        -- vim.keymap.set('n', '<leader-x>', kiwi.todo.toggle, {})
    end,
}

