local kiwi = require("kiwi")

kiwi.setup({
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
})

-- Necessary keybindings
vim.keymap.set('n', '<leader>kw', kiwi.open_wiki_index, {})
vim.keymap.set('n', '<leader>kd', kiwi.open_diary_index, {})
vim.keymap.set('n', '<leader>kn', kiwi.open_diary_new, {})
-- vim.keymap.set('n', '<leader-x>', kiwi.todo.toggle, {})
