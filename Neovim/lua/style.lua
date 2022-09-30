vim.cmd("colorscheme gruvbox")
vim.cmd("set termguicolors")

require'bufferline'.setup{}

require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true
  },
}

require'lspkind'.init {}
