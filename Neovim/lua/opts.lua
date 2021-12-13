vim.g.startify_lists = {
  { type = 'sessions', header = { '  Saved Sessions' }},
  { type = 'dir',      header = { '  Recent Files' }}
}

vim.g.startify_change_to_dir = false
vim.g.startify_change_to_vcs_root = false
vim.g.startify_fortune_use_unicode = true
vim.g.startify_custom_header = 'startify#pad(startify#fortune#boxed())'

vim.wo.number = true

vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

vim.bo.tabstop = 4
vim.bo.softtabstop = 4
vim.bo.shiftwidth = 4
vim.bo.expandtab = true

vim.cmd("autocmd BufRead,BufNewFile *.jl :set filetype=julia")

vim.o.hidden = true

vim.g.floaterm_keymap_toggle = '.t'

vim.o.clipboard = 'unnamedplus'

vim.g.encoding = 'UTF-8'

vim.o.completeopt = "menuone,noselect"
