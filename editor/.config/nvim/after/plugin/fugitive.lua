-- now that we have the plugin installed prepend this block in the status line
vim.opt.statusline = vim.opt.statusline ^ '%{FugitiveStatusline()}'
vim.opt.statusline = vim.opt.statusline ^ '%#PmenuSel#'
