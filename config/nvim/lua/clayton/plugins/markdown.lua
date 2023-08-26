return {
    'iamcco/markdown-preview.nvim',
    lazy = true,
    ft = "markdown",
    -- if this func doesn't auto run, run it with :call mkdp#util#install() 
    build = function() vim.fn['mkdp#util#install']() end,
}
