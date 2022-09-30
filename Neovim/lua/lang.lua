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
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
    }),
    completion = {
        keyword_length = 1,
        completeopt = "menu,noselect"
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'orgmode' },
        { name = 'neorg' }
    },
    formatting = {
        format = lspkind.cmp_format({
            mode = "symbol_text",
            menu = ({nvim_lsp = "[LSP]"})
        })
    }
})

local capabilities = require'cmp_nvim_lsp'.update_capabilities(vim.lsp.protocol.make_client_capabilities())
local lspcfg = require'lspconfig' 
lspcfg.julials.setup  { capabilities=capabilities }
lspcfg.pylsp.setup    { capabilities=capabilities }
lspcfg.hls.setup      { capabilities=capabilities }
lspcfg.ccls.setup     { capabilities=capabilities }
lspcfg.texlab.setup   { capabilities=capabilities }
lspcfg.tsserver.setup { capabilities=capabilities }

require'neorg'.setup {
    load = {
        ['core.defaults'] = {},
        ['core.export'] = {},
        ['core.norg.completion'] = {
            config = {engine = 'nvim-cmp'}
        },
        ['core.export.markdown'] = {
            config = {extensions = {'metadata'}}
        }
    }
}
