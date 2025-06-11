return {
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        opts = {
            check_ts = true,
            ts_config = {
                lua = { 'string' }, -- don't add pairs in lua string treesiter nodes
                javascript = { 'template_string' }, -- don't add pairs in javascript template_string
            },
        },
        config = function(_, opts)
            local npairs = require('nvim-autopairs')
            local Rule = require('nvim-autopairs.rule')
            npairs.setup(opts)
            npairs.add_rule(Rule("\\[","\\]","tex"))
            npairs.add_rule(Rule("\\(","\\)","tex"))
        end
    },
    {
        'windwp/nvim-ts-autotag',
        event = "InsertEnter"
    },
}
