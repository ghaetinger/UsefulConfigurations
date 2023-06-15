local cmp = require'cmp'
local wk  = require'which-key'
local telescope = require'telescope.builtin'

function diag_function()
    telescope.diagnostics({bufnr=0})
end

wk.setup {}
wk.register({
    [","] = {
        name = "Buffers",
        [","] = {"<cmd>BufferPrevious<cr>", "<-" },
        ["."] = {"<cmd>BufferNext<cr>", "->" },
        k     = {"<cmd>bdelete<cr>", "Kill Buffer" }

    },
    ["."] = {
        name = "Floating Things",
        g = {"<cmd>LazyGit<cr>", "Lazy Git" },
        f = { telescope.find_files, "Find File" },
        r = { telescope.live_grep, "Live Grep" },
        b = { telescope.buffers, "Buffers" },
        h = { telescope.help_tags, "Help Tags" },
        w = { diag_function, "Show me buffer diagnostics" },
        W = { telescope.diagnostics, "Show me ALL diagnostics" },
        t = {"<cmd>NvimTreeToggle<cr>", "File Tree" }
    },
    g = {
        name = "Code",
        p = { vim.lsp.buf.format, "Pretty Code" },
        h = { vim.lsp.buf.hover, "Docs" },
        r = { vim.lsp.buf.references, "References" },
        d = { vim.lsp.buf.declaration, "Declaration" },
        w = { vim.diagnostic.open_float, "What's going on here?" },
        a = { cmp.mapping.complete, "Complete Here" },
        c = { name = "Komment" }
    },
})
