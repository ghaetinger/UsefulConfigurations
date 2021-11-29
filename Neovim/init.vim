lua require 'init'
:autocmd VimResized * wincmd =
":autocmd BufEnter * lua require'completion'.on_attach()
