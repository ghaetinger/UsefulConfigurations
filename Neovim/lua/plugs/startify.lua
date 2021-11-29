bind = require('binds')

-- update session on exit
vim.g.startify_session_persistence = true

-- show only recent files and sessions
vim.g.startify_lists = {
  { type = 'sessions', header = { '  Saved Sessions' }},
  { type = 'dir',      header = { '  Recent Files' }}
}

vim.g.startify_change_to_dir = false;
vim.g.change_to_vcs_root = true;
vim.g.startify_fortune_use_unicode = true;
vim.g.startify_custom_header = 'startify#pad(startify#fortune#boxed())'

-- save session
bind('n', '<leader>ss', function() vim.cmd('SSave') end, 'noremap', 'cmd')
-- list project
bind('n', '<leader>lp', function() vim.cmd('SClose') end, 'noremap', 'cmd')
