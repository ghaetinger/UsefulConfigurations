bind = require('binds')

bind('n', ',.', function() vim.cmd('BufferLineCycleNext') end, 'cmd')
bind('n', ',,', function() vim.cmd('BufferLineCyclePrev') end, 'cmd')
bind('n', ',k', function() vim.cmd('bdelete') end, 'cmd')

bind('n', '.p', function() vim.cmd('NvimTreeToggle') end, 'cmd')
bind('n', '.f', function() vim.lsp.buf.formatting() end, 'cmd')
bind('n', '.l', function() vim.lsp.buf.hover() end, 'cmd')
bind('n', '.g', function() vim.cmd('LazyGit') end, 'cmd')

bind('n', 'gd', function() vim.lsp.buf.definition() end, 'cmd')
bind('n', 'gr', function() vim.lsp.buf.references() end, 'cmd')

bind('n', 'ff', function() vim.cmd('Telescope find_files') end, 'cmd')
bind('n', 'fg', function() vim.cmd('Telescope live_grep') end, 'cmd')
bind('n', 'fb', function() vim.cmd('Telescope buffers') end, 'cmd')
bind('n', 'fh', function() vim.cmd('Telescope help_tags') end, 'cmd')
