-- quick-save
vim.keymap.set('n', '<leader>w', ':w<cr>')
-- fix last spelling error in insert mode
vim.keymap.set('i', '<C-l>', '<c-g>u<Esc>[s1z=`]a<c-g>u')
-- paste clipboard into buffer
vim.keymap.set({ 'n', 'v' }, '<leader>p', '"+p')
-- copy buffer into clipboard
vim.keymap.set({ 'n', 'v' }, '<leader>c', '"+yy')
-- open corresponding .pdf/.html or preview
vim.keymap.set('n', '<leader>o', ':!opout "%:p"<cr><cr>')
-- compile document, be it groff/LaTeX/markdown/etc
vim.keymap.set('n', '<leader>l', ':w! | !compiler "%:p"<cr><cr>')
-- stop highlight searching
vim.keymap.set({ 'n', 'v' }, '<C-s>', ':nohlsearch<cr>')
-- jump to start and end of line using the home row keys
vim.keymap.set({ 'n', 'v' }, 'H', '^')
vim.keymap.set({ 'n', 'v' }, 'L', '$')
-- search results centered please
vim.keymap.set('n', 'n', 'nzz', { silent = true })
vim.keymap.set('n', 'N', 'Nzz', { silent = true })
vim.keymap.set('n', '*', '*zz', { silent = true })
vim.keymap.set('n', '#', '#zz', { silent = true })
vim.keymap.set('n', 'g*', 'g*zz', { silent = true })
-- magic by default
vim.keymap.set('n', '?', '?\\v')
vim.keymap.set('n', '/', '/\\v')
vim.keymap.set('c', '%s/', '%sm/')
-- left and right switch buffers
vim.keymap.set('n', '<left>', ':bp<cr>')
vim.keymap.set('n', '<right>', ':bn<cr>')
-- toggle between buffers
vim.keymap.set('n', '<leader><leader>', '<c-^>')
-- easier split navigation
vim.keymap.set({ 'n', 'v' }, '<C-h>', '<C-w>h')
vim.keymap.set({ 'n', 'v' }, '<C-j>', '<C-w>j')
vim.keymap.set({ 'n', 'v' }, '<C-k>', '<C-w>k')
vim.keymap.set({ 'n', 'v' }, '<C-l>', '<C-w>l')
-- delete buffer
vim.keymap.set({ 'n', 'v' }, '<leader>d', ':bdelete<cr>')
-- open new tab
vim.keymap.set({ 'n', 'v' }, '<leader>t', ':tabnew<cr>')
-- close tab (buffer remains open)
vim.keymap.set({ 'n', 'v' }, '<leader>x', ':tabclose<cr>')
-- go to tab by number
vim.keymap.set({ 'n', 'v' }, '<leader>1', '1gt')
vim.keymap.set({ 'n', 'v' }, '<leader>2', '2gt')
vim.keymap.set({ 'n', 'v' }, '<leader>3', '3gt')
vim.keymap.set({ 'n', 'v' }, '<leader>4', '4gt')
vim.keymap.set({ 'n', 'v' }, '<leader>5', '5gt')
vim.keymap.set({ 'n', 'v' }, '<leader>6', '6gt')
vim.keymap.set({ 'n', 'v' }, '<leader>7', '7gt')
vim.keymap.set({ 'n', 'v' }, '<leader>8', '8gt')
vim.keymap.set({ 'n', 'v' }, '<leader>9', '9gt')
vim.keymap.set({ 'n', 'v' }, '<leader>0', ':tablast<cr>')
