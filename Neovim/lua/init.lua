require('opts')
require('plugs')
require('keys')
require('style')

local lsp = require "lspconfig"
local completion = require "completion"

function on_attach()
    completion.on_attach()
end

lsp.elixirls.setup{
    on_attach = on_attach,
    cmd = { "/Users/ghaetinger/Documents/elixir-ls/language_server.sh" };
}

lsp.rust_analyzer.setup{
    on_attach = on_attach
}

lsp.texlab.setup{
    on_attach = on_attach
}

lsp.julials.setup{
    on_attach = on_attach
}
