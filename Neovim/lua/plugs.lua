vf = require('vfuncs')
vf.plug.begin(vf.stdpath('data') .. '/plugged')

vim.cmd("Plug 'kyazdani42/nvim-web-devicons'")
vim.cmd("Plug 'ryanoasis/vim-devicons'")
vim.cmd("Plug 'elixir-editors/vim-elixir'")
vim.cmd("Plug 'kyazdani42/nvim-tree.lua'")
vim.cmd("Plug 'akinsho/nvim-bufferline.lua'")
vim.cmd("Plug 'onsails/lspkind-nvim'")
vim.cmd("Plug 'swalladge/antarctic-vim'")
vim.cmd("Plug 'cormacrelf/vim-colors-github'")
vim.cmd("Plug 'kdheepak/lazygit.nvim'")
vim.cmd("Plug 'kdheepak/JuliaFormatter.vim'")
vim.cmd("Plug 'folke/tokyonight.nvim'")
vim.cmd("Plug 'jonstoler/werewolf.vim'")
vim.cmd("Plug 'voldikss/vim-floaterm'")
vim.cmd("Plug 'owozsh/amora'")
vim.cmd("Plug 'nvim-lua/completion-nvim'")
vim.cmd("Plug 'lervag/vimtex'")
vim.cmd("Plug 'hoob3rt/lualine.nvim'")
vim.cmd("Plug 'NLKNguyen/papercolor-theme'")

vim.cmd("Plug 'neovim/nvim-lspconfig'")

vim.cmd("Plug 'preservim/nerdcommenter'")
vim.cmd("filetype plugin on")

vim.cmd("Plug 'nvim-lua/popup.nvim'")
vim.cmd("Plug 'nvim-lua/plenary.nvim'")
vim.cmd("Plug 'nvim-telescope/telescope.nvim'")

vim.cmd("Plug 'nvim-treesitter/nvim-treesitter'")
-- smooth scrolling
vim.cmd("Plug 'psliwka/vim-smoothie'") 
-- theme
vim.cmd("Plug 'dracula/vim', { 'as': 'dracula' }")
vim.cmd("Plug 'morhetz/gruvbox', { 'as': 'gruvbox' }")
-- start menu
vim.cmd("Plug 'mhinz/vim-startify'")

vf.plug['end']()

-- import plugs settings
require('plugs.treesitter')
require('plugs.startify')
