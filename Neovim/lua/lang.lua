local cmp = require'cmp'
local lspkind = require'lspkind'

cmp.setup({
    mapping = cmp.mapping.preset.insert({
        ['<C-n>'] = function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            else
                fallback()
            end
        end,
        ['<C-p>'] = function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            else
                fallback()
            end
        end,
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-j>'] = cmp.mapping.scroll_docs(4),
        ['<C-k>'] = cmp.mapping.scroll_docs(-4),
    }),
    snippet = {
      expand = function(args)
        require'luasnip'.lsp_expand(args.body)
      end
    },
    window = {
        documentation = cmp.config.window.bordered(),
        completion = cmp.config.window.bordered(),
    },
    completion = {
        keyword_length = 1,
        completeopt = "menu,noselect"
    },
    sources = {
        { name = 'luasnip' },
        { name = 'path' },
        { name = 'nvim_lsp' },
        { name = 'orgmode' },
        { name = 'neorg' },
    },
    formatting = {
        format = lspkind.cmp_format({
            mode = "symbol_text",
            menu = ({
                nvim_lsp = '🤓',
                luasnip = '🌙',
            })
        })
    }
})

local lspcfg = require'lspconfig' 

lspcfg.pylsp.setup {}
lspcfg.sourcekit.setup {}
lspcfg.rust_analyzer.setup {
        settings = {
        ["rust-analyzer"] = {
            imports = {
                granularity = {
                    group = "module",
                },
                prefix = "self",
            },
            cargo = {
                buildScripts = {
                    enable = true,
                },
            },
            procMacro = {
                enable = true
            },
        }
    }
}

require("luasnip.loaders.from_vscode").lazy_load()
