vim.cmd('colorscheme dracula')
vim.cmd('set termguicolors')

require'bufferline'.setup{}

-- commented options are defaults
require('lspkind').init({
    with_text = true,
    symbol_map = {
      Text = '',
      Method = 'ƒ',
      Function = '',
      Constructor = '',
      Variable = '',
      Class = '',
      Interface = 'ﰮ',
      Module = '',
      Property = '',
      Unit = '',
      Value = '',
      Enum = '了',
      Keyword = '',
      Snippet = '﬌',
      Color = '',
      File = '',
      Folder = '',
      EnumMember = '',
      Constant = '',
      Struct = ''
    },
})

vim.o.background = 'dark'
require('lualine').setup{
  options = {
    theme = 'dracula',
    section_separators = {'', ''},
    component_separators = {'', ''}
  }
}
