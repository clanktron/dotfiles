return {
    -- lightweight vimwiki
    'serenevoid/kiwi.nvim',
    lazy = true,
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
    keys = {
        {'<leader>kw', function() require("kiwi").open_wiki_index {} end, desc = "Open VimWiki index"},
        {'<leader>kd', function() require("kiwi").open_diary_index {} end, desc = "Open diary index"},
        {'<leader>kn', function() require("kiwi").open_diary_new {} end, desc = "New diary entry"},
        -- {'<leader-x>', require("kiwi").todo.toggle, desc = "Toggle VimWiki todo"},
    },
}

