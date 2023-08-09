local kiwi = require("kiwi")

kiwi.setup({
  {
    name = "blog",
    path = os.getenv("BLOG_DIR")
  }
  -- {
  --   name = "knowledge-base",
  --   path = "/home/username/personal-wiki"
  -- }
})

-- Necessary keybindings
vim.keymap.set('n', '<leader>kw', kiwi.open_wiki_index, {})
vim.keymap.set('n', '<leader>kd', kiwi.open_diary_index, {})
vim.keymap.set('n', '<leader>kn', kiwi.open_diary_new, {})
-- vim.keymap.set('n', '<leader-x>', kiwi.todo.toggle, {})
