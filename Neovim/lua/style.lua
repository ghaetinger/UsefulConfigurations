vim.cmd("set termguicolors")
-- vim.cmd("colorscheme dracula")

vscode = require'vscode'
vim.o.background = 'dark'
-- vim.o.background = 'light'
vscode.setup({
    italic_comments = true,
})
vscode.load()
vim.cmd("colorscheme onedark")

require'todo-comments'.setup{}

require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    norg,
    norg_meta,
    norg_table 
  },
  highlight = {
    enable = true
  },
}

require'barbar'.setup{}

local border = {
      {"╭", "FloatBorder"},
      {"─", "FloatBorder"},
      {"╮", "FloatBorder"},
      {"│", "FloatBorder"},
      {"╯", "FloatBorder"},
      {"─", "FloatBorder"},
      {"╰", "FloatBorder"},
      {"│", "FloatBorder"},
}

local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = opts.border or border
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end
