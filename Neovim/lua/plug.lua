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
    {'glepnir/galaxyline.nvim', ['branch'] = 'main'},
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
    'nvim-lua/completion-nvim',
    'onsails/lspkind-nvim',
    'neovimhaskell/haskell-vim'
})
