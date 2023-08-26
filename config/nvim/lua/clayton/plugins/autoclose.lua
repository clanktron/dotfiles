return {
    {
        'windwp/nvim-autopairs',
        opts = {
            check_ts = true,
            ts_config = {
                lua = { 'string' }, -- don't add pairs in lua string treesiter nodes
                javascript = { 'template_string' }, -- don't add pairs in javascript template_string
            },
        },
    },
    {
        'windwp/nvim-ts-autotag',
    },
}
