local cmp = require'cmp'
local wk  = require'which-key'
local telescope = require'telescope.builtin'

wk.setup {}
wk.register({
    [","] = {
        name = "Buffers",
        [","] = {"<cmd>BufferLineCyclePrev<cr>", "<-" },
        ["."] = {"<cmd>BufferLineCycleNext<cr>", "->" },
        k     = {"<cmd>bdelete<cr>", "Kill Buffer" }

    },
    ["."] = {
        name = "Floating Things",
        g = {"<cmd>LazyGit<cr>", "Lazy Git" },
        f = { telescope.find_files, "Find File" },
        r = { telescope.live_grep, "Live Grep" },
        b = { telescope.buffers, "Buffers" },
        h = { telescope.help_tags, "Help Tags" }
    },
    g = {
        name = "Code",
        p = { vim.lsp.buf.formatting, "Pretty Code" },
        h = { vim.lsp.buf.hover, "Docs" },
        r = { vim.lsp.buf.references, "References" },
        d = { vim.lsp.buf.declaration, "Declaration" },
        a = { cmp.mapping.complete, "Complete Here" },
        c = { name = "Komment" }
    }
})
