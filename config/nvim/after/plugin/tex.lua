-- This is necessary for VimTeX to load properly. The "indent" is optional.
-- Note that most plugin managers will do this automatically.
vim.cmd[[filetype plugin indent on]]

-- This enables Vim's and neovim's syntax-related features. Without this, some
-- VimTeX features will not work (see ":help vimtex-requirements" for more
-- info).
vim.cmd[[syntax enable]]

-- Viewer options: One may configure the viewer either by specifying a built-in
-- viewer method:
vim.g.vimtex_view_method = 'zathura'

-- Or with a generic interface:
-- let g:vimtex_view_general_viewer = 'okular'
-- let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
-- vim.g.vimtex_imaps_leader = "-"
vim.g.vimtex_compiler_method = 'latexmk'

-- Inesert mode leader key
vim.g.vimtex_imaps_leader = "`"

-- Most VimTeX mappings rely on localleader and this can be changed with the
-- following line. The default is usually fine and is the symbol "\".
vim.g.maplocalleader = "\\"
