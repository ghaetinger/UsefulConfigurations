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
    'kyazdani42/nvim-web-devicons',
    'ryanoasis/vim-devicons',
    'arcticicestudio/nord-vim',
    'mhinz/vim-startify',
    'nvim-treesitter/nvim-treesitter',
    'nvim-lua/plenary.nvim',
    'nvim-lua/popup.nvim',
    'nvim-telescope/telescope.nvim',
    'akinsho/nvim-bufferline.lua',
    'onsails/lspkind-nvim',
    'petrbroz/vim-glsl',
    'kdheepak/lazygit.nvim',
    'kdheepak/JuliaFormatter.vim',
    'direnv/direnv.vim',
    'lervag/vimtex',
    'owozsh/amora',
    'voldikss/vim-floaterm',
    'neovim/nvim-lspconfig',
    'onsails/lspkind-nvim',
    'neovimhaskell/haskell-vim',
    'b3nj5m1n/kommentary',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/nvim-cmp',
    'morhetz/gruvbox',
    'nvim-lualine/lualine.nvim',
    'kyazdani42/nvim-web-devicons',
    'nvim-orgmode/orgmode', 
    'ThePrimeagen/vim-be-good',
    'folke/which-key.nvim',
    'goolord/alpha-nvim',
    'nvim-neorg/neorg',
    'catppuccin/nvim',
    'B4mbus/oxocarbon-lua.nvim',
    'rcarriga/nvim-notify',
    'olimorris/onedarkpro.nvim',
    'Mofiqul/vscode.nvim',
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip' 
})
