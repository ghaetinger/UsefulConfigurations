local vim = vim
local function plug(path, config)
    vim.validate {
        path = {path, 's'},
	config = {config, vim.tbl_islist, 'an array of packages'},
    }

    vim.fn["plug#begin"](path)
    for _, v in ipairs(config) do
        if type(v) == 'string' then
	    vim.fn["plug#"](v)
	elseif type(v) == 'table' then
	    local p = v[1]
	    assert(p, 'Must specify package as first index.')
	    v[1] = nil
	    vim.fn["plug#"](p, v)
	    v[1] = p
	end
    end
    vim.fn["plug#end"]()
end


plug(tostring(os.getenv("HOME")) .. '/.vim/plugged', {
    'B4mbus/oxocarbon-lua.nvim',
    'L3MON4D3/LuaSnip',
    'Mofiqul/vscode.nvim',
    'ThePrimeagen/vim-be-good',
    'akinsho/nvim-bufferline.lua',
    'alfredodeza/pytest.vim',
    'arcticicestudio/nord-vim',
    'b3nj5m1n/kommentary',
    'catppuccin/nvim',
    'direnv/direnv.vim',
    'folke/todo-comments.nvim',
    'folke/which-key.nvim',
    'goolord/alpha-nvim',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-path',
    'hrsh7th/nvim-cmp',
    'kdheepak/JuliaFormatter.vim',
    'kdheepak/lazygit.nvim',
    'kyazdani42/nvim-web-devicons',
    'kyazdani42/nvim-web-devicons',
    'lervag/vimtex',
    'mhinz/vim-startify',
    'morhetz/gruvbox',
    'neovim/nvim-lspconfig',
    'neovimhaskell/haskell-vim',
    'nvim-lua/plenary.nvim',
    'nvim-lua/popup.nvim',
    'nvim-lualine/lualine.nvim',
    'nvim-orgmode/orgmode', 
    'nvim-telescope/telescope.nvim',
    'nvim-treesitter/nvim-treesitter',
    'nvim-treesitter/nvim-treesitter-context',
    'olimorris/onedarkpro.nvim',
    'onsails/lspkind-nvim',
    'onsails/lspkind-nvim',
    'owozsh/amora',
    'petrbroz/vim-glsl',
    'psf/black',
    'rcarriga/nvim-notify',
    'ryanoasis/vim-devicons',
    'saadparwaiz1/cmp_luasnip',
    'voldikss/vim-floaterm',
    'romgrk/barbar.nvim',
    'nvim-tree/nvim-tree.lua',
})
