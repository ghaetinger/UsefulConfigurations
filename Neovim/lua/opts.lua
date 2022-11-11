vim.wo.relativenumber = true 


vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

vim.bo.tabstop = 4
vim.bo.softtabstop = 4
vim.bo.shiftwidth = 4
vim.bo.expandtab = true

vim.g.floaterm_wintype       = 'float'
vim.g.floaterm_keymap_toggle = '.t'
vim.g.floaterm_keymap_new    = '.n'
vim.g.floaterm_keymap_prev   = ';.'
vim.g.floaterm_keymap_next   = '.;'
vim.g.floaterm_borderchars   = '─│─│╭╮╯╰'

vim.cmd([[
hi Floaterm guibg=black
hi FloatermBorder guibg=none guifg=cyan
]])

vim.o.clipboard = 'unnamedplus'
vim.o.mouse = ''

vim.g.encoding = 'UTF-8'

vim.o.completeopt = "menuone,noselect"

vim.o.ch = 0
