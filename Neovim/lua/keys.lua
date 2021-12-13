_bindfuncs = {}
local bindfunc_i = 0

local function map(mode, lhs, rhs, ...)
  local opt = {}
  for _, a in ipairs({...}) do opt[a] = true end

  if type(rhs) == 'function' then
    bindfunc_i = bindfunc_i + 1
    local name = 'bindfunc_' .. tostring(bindfunc_i)
    _bindfuncs[name] = rhs
    if opt.cmd then
      rhs = '<cmd>call v:lua._bindfuncs.' .. name .. '()<cr>'
      opt.cmd = nil
    else
      rhs = 'v:lua._bindfuncs.' .. name .. '()'
      opt.expr = true
    end
  end

  return vim.api.nvim_set_keymap(mode, lhs, rhs, opt)
end

map('n', 'ff', require('telescope.builtin').find_files, 'cmd')
map('n', 'fg', require('telescope.builtin').live_grep, 'cmd')
map('n', 'fb', require('telescope.builtin').buffers, 'cmd')
map('n', 'fh', require('telescope.builtin').help_tags, 'cmd')

map('n', ',,', function() vim.cmd('BufferLineCyclePrev') end, 'cmd')
map('n', ',.', function() vim.cmd('BufferLineCycleNext') end, 'cmd')
map('n', ',k', function() vim.cmd('bdelete') end, 'cmd')


map('n', '.g', function() vim.cmd('LazyGit') end, 'cmd')
map('n', '.f', vim.lsp.buf.formatting, 'cmd')
map('n', '.l', vim.lsp.buf.hover, 'cmd')

map('n', 'gr', vim.lsp.buf.references, 'cmd')
map('n', 'gd', vim.lsp.buf.declaration, 'cmd')
