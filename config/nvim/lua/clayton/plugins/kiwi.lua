return {
    -- lightweight vimwiki
    dir = '/Users/clayton/Developer/repos/vendor/kiwi.nvim',
    lazy = true,
    dependencies = {
        'nvim-lua/plenary.nvim',
    },
    opts = {
        {
            name = "wiki",
            path = os.getenv("WIKI"),
            wiki = true,
            diary = false
        },
        {
            name = "blog",
            path = os.getenv("BLOG_DIR"),
            wiki = true,
            diary = false
        },
        {
            name = "diary",
            path = os.getenv("DIARY_DIR"),
            diary = true,
            wiki = false
        }
    },
    keys = {
        {'<leader>kw', function() require("kiwi").open_wiki_index {} end, desc = "Open VimWiki index"},
        {'<leader>kd', function() require("kiwi").open_diary_index {} end, desc = "Open diary index"},
        {'<leader>kn', function() require("kiwi").open_diary_new {} end, desc = "New diary entry"},
        -- {'\\x', require("kiwi").todo.toggle, desc = "Toggle VimWiki todo"},
    },
}

