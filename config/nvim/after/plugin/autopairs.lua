local npairs = require('nvim-autopairs')
local rule = require('nvim-autopairs.rule')
local cond = require('nvim-autopairs.conds')

npairs.setup({
    check_ts = true,
    ts_config = {
        lua = { 'string' }, -- don't add pairs in lua string treesiter nodes
        javascript = { 'template_string' }, -- don't add pairs in javascript template_string
    },
})

npairs.add_rule(rule("$$","$$",{"tex", "latex", "markdown"}))

npairs.add_rules({
  rule("$", "$",{"tex", "latex", "markdown"})
    -- don't add a pair if the next character is %
    :with_pair(cond.not_after_regex("%%"))
    -- don't add a pair if  the previous character is xxx
    :with_pair(cond.not_before_regex("xxx", 3))
    -- don't move right when repeat character
    :with_move(cond.none())
    -- don't delete if the next character is xx
    :with_del(cond.not_after_regex("xx"))
    -- disable adding a newline when you press <cr>
    :with_cr(cond.none())
  },
  -- disable for .vim files, but it work for another filetypes
  rule("a","a","-vim")
)
