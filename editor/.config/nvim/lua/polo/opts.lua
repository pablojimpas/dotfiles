-- automatically write files when changing open buffers
vim.opt.autowrite = true
-- automatically indent new lines
vim.opt.smartindent = true
-- don't mess around with my lines
vim.opt.wrap, vim.opt.foldenable = false, false
-- show relative line numbers alongside absolute current line number
vim.opt.number, vim.opt.relativenumber = true, true
-- show colored columns at sensible locations
vim.opt.colorcolumn = '80,120'
-- start the scrolling motion before reaching the edges
vim.opt.scrolloff = 8
-- use wide tabs (assumes shiftwidth and tabstop are 8 as well)
vim.opt.softtabstop = 8
-- open splits in a non-retarded way, unlike vim defaults
vim.opt.splitbelow, vim.opt.splitright = true, true
-- proper search
vim.opt.ignorecase, vim.opt.smartcase = true, true
-- more risky, but cleaner
vim.opt.swapfile, vim.opt.writebackup = false, false
-- permanent undo
vim.opt.undofile = true
-- set completeopt to have a better completion experience
vim.opt.completeopt = 'menuone,noselect'
-- use 24-bit RGB color, requires compatible terminal
vim.opt.termguicolors = true
-- speed up macro execution
vim.opt.lazyredraw = true
-- longer updatetime leads to noticeable delays and poor user experience
vim.opt.updatetime = 100
-- https://stackoverflow.com/questions/2158516/delay-before-o-opens-a-new-line
vim.opt.timeoutlen = 300
-- wrapping options
vim.opt.textwidth, vim.opt.formatoptions = 80, 'tcrqnb'
-- spell checks
vim.opt.spelllang = 'es,en'
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
  pattern = {"*.md", "*.tex", "*.txt", "*.ms", "*.me", "*.mom", "*.man"},
  command = "setlocal spell",
})
-- hide concealed text unless there's a replacement
vim.opt.conceallevel = 2
-- always reserve space for sign column
vim.opt.signcolumn = 'yes'
-- don't waste space with an extra thick column on the left
vim.opt.signcolumn = 'number'
-- avoid losing focus
vim.opt.cursorline = true
-- custom status line
vim.opt.statusline = ''
  .. '%#Conceal#'                                 -- see :help hitest for colors
  .. ' %f'                                        -- file path in current buffer
  .. '%m'                                         -- modified flag
  .. '%='                                         -- separation
  .. '%y'                                         -- file type
  .. ' %{&fileencoding?&fileencoding:&encoding}'  -- better be utf-8
  .. '|%{&fileformat}'                            -- better be unix format (\n)
  .. ' %p%%'                                      -- line scroll percentage
  .. ' %l:%c '                                    -- line and column numbers

vim.filetype.add({ extension = { templ = "templ" } })
