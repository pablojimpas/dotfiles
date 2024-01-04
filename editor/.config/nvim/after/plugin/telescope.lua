-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
require('telescope').setup({})

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')

-- See `:help telescope.builtin`
vim.keymap.set('n', '<C-p>', require('telescope.builtin').find_files)
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles)
vim.keymap.set('n', '<leader>o', require('telescope.builtin').buffers)
vim.keymap.set('n', '<leader>g', require('telescope.builtin').git_files)
vim.keymap.set('n', '<leader>s', require('telescope.builtin').live_grep)
