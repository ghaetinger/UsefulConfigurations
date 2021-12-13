require'lspconfig'.julials.setup{ on_attach=require'completion'.on_attach }
require'lspconfig'.hls.setup{ on_attach=require'completion'.on_attach }
require'lspconfig'.ccls.setup{ on_attach=require'completion'.on_attach }
require'lspconfig'.texlab.setup{ on_attach=require'completion'.on_attach }
