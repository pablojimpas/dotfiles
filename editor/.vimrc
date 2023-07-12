" detect vim-tiny (which lacks 'eval') to avoid loading vim defaults
if has("eval")
	let skip_defaults_vim = 1
endif

" if I wanted to use vi I wouldn't have bothered with any of this shit
set nocompatible

" use the only sane character encoding
set encoding=utf-8
" automatically update open buffers that have been modified elsewhere
set autoread
" automatically write files when changing when multiple files open
set autowrite
" automatically indent new lines
set autoindent smartindent
" autocomplete in command mode
set wildmenu wildmode=longest,list,full
" stop complaints about switching buffer with changes
set hidden
" don't mess around with my lines
set nowrap nofoldenable
" don't waste space with an extra thick column on the left
set signcolumn=number
" show relative line numbers alongside absolute current line number
set number relativenumber
" show colored columns at sensible locations
set colorcolumn=80,120
" start the scrolling motion before reaching the edges
set scrolloff=8
" open splits in a non-retarded way, unlike vim defaults
set splitbelow splitright
" proper search
set incsearch hlsearch ignorecase smartcase
" more risky, but cleaner
set nobackup noswapfile nowritebackup
" permanent undo
set undodir=~/.vimdid undofile
" speed up macro execution
set lazyredraw
" longer updatetime leads to noticeable delays and poor user experience.
set updatetime=100
" http://stackoverflow.com/questions/2158516/delay-before-o-opens-a-new-line
set timeoutlen=300
" show status line always
set laststatus=2
" show mode hints in the default status bar
set showmode
" show last command in the bottom right of the screen
set showcmd
" use the custom status line below to show row and col number
set ruler
" custom status line
set statusline=
set statusline+=%#Conceal# " see :help hitest for colors
set statusline+=\ %f " file path in current buffer
set statusline+=%m " modified flag
set statusline+=%= " separation
set statusline+=\ %y " file type
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\|%{&fileformat}
set statusline+=\ %p%% " percentage through file lines
set statusline+=\ %l:%c " line and column numbers
set statusline+=\  " empty space at the end

" use wide tabs
set shiftwidth=8
set softtabstop=8
set tabstop=8
set noexpandtab

" wrapping options
set formatoptions=tc " wrap text and comments using textwidth
set formatoptions+=r " continue comments when pressing ENTER in I mode
set formatoptions+=q " enable formatting of comments with gq
set formatoptions+=n " detect lists for formatting
set formatoptions+=b " auto-wrap in insert mode, and do not wrap old long lines
set textwidth=80

" spell check
autocmd BufRead,BufNewFile *.md,*.tex,*.txt,*.ms,*.me,*.mom,*.man setlocal spell
set spelllang=es,en
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

" allow filetype detection
filetype plugin indent on
" enable syntax highlighting if available
if has("syntax")
	syntax enable
endif
if !has('gui_running')
	set t_Co=256
endif

" customize cursor shape:
"  1 -> blinking block
"  2 -> solid block
"  3 -> blinking underscore
"  4 -> solid underscore
"  5 -> blinking vertical bar
"  6 -> solid vertical bar
let &t_SI = "\e[6 q" " insert mode
let &t_EI = "\e[2 q" " normal mode

let mapleader = "\<space>"

" quick-save
nmap <leader>w :w<CR>
" paste clipboard into buffer
noremap <leader>p :read !xsel --clipboard --output<cr>
" copy buffer into clipboard
noremap <leader>c :w !xsel -ib<cr><cr>
" stop highlight searching
vnoremap <C-s> :nohlsearch<cr>
nnoremap <C-s> :nohlsearch<cr>
" move selected line in visual mode up and down
vnoremap K :m '<-2<CR>gv=gv
vnoremap J :m '>+1<CR>gv=gv
" jump to start and end of line using the home row keys
map H ^
map L $
" search results centered please
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz
" very magic by default
nnoremap ? ?\v
nnoremap / /\v
cnoremap %s/ %sm/
" left and right can switch buffers
nnoremap <left> :bp<CR>
nnoremap <right> :bn<CR>
" <leader><leader> toggles between buffers
nnoremap <leader><leader> <c-^>
" shortcuts for split navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
" disable help, I can type :help on my own, thanks.
map <F1> <Esc>
imap <F1> <Esc>
" delete buffer
noremap <leader>d :bdelete<CR>
" open new tab
noremap <leader>t :tabnew<CR>
" close tab (buffer remains open)
noremap <leader>x :tabclose<CR>
" go to tab by number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

" leave paste mode when leaving insert mode
autocmd InsertLeave * set nopaste
" jump to last edit position on opening file
" https://stackoverflow.com/questions/31449496/vim-ignore-specifc-file-in-autocommand
autocmd BufReadPost * if expand('%:p') !~# '\m/\.git/' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
" help filetype detection
autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd BufRead,BufNewFile *.tex set filetype=tex
autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff
autocmd BufRead,BufNewFile *.pl set filetype=prolog

autocmd FileType markdown setlocal tw=80 et ts=2 sw=2
autocmd FileType text setlocal tw=80

function! s:goyo_enter()
    if executable('tmux') && strlen($TMUX)
      silent !tmux set status off
      silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
    endif
    set noshowmode noshowcmd noruler laststatus=0
    set nonumber norelativenumber
    set cc=
    set scrolloff=999
endfunction
function! s:goyo_leave()
    if executable('tmux') && strlen($TMUX)
      silent !tmux set status on
      silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
    endif
    set showmode showcmd ruler laststatus=2
    set number relativenumber
    set cc=80,120
    set scrolloff=8
endfunction
map <leader>f :Goyo<CR>
autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
let g:goyo_width = 81

" load vim's builtin man plugin
runtime ftplugin/man.vim
" use it by default when pressing K
set keywordprg=:Man

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" make sure plugin manager is available
if ! filereadable(expand("~/.vim/autoload/plug.vim"))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif
call plug#begin()
	" basics
	Plug 'editorconfig/editorconfig-vim'
	Plug 'tpope/vim-commentary'
	Plug 'tpope/vim-speeddating'
	Plug 'tpope/vim-sleuth'
	Plug 'tpope/vim-dispatch'
	Plug 'tpope/vim-fugitive'
	Plug 'tpope/vim-rhubarb'
	Plug 'tpope/vim-repeat'
	Plug 'tpope/vim-surround'
	Plug 'tpope/vim-endwise'
	" interface enhancements
	Plug 'machakann/vim-highlightedyank'
	Plug 'junegunn/goyo.vim'
	" fuzzy finder
	Plug 'junegunn/fzf.vim'
	Plug 'airblade/vim-rooter'
	" colors
	Plug 'plan9-for-vimspace/acme-colors'
	" language-specific plugins
	Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
	Plug 'dart-lang/dart-vim-plugin', { 'for': 'dart' }
	Plug 'natebosch/vim-lsc'
	Plug 'natebosch/vim-lsc-dart'
	Plug 'lervag/vimtex'
	Plug 'aklt/plantuml-syntax'
call plug#end()

" ensure that editorconfig-vim and vim-fugitive work well together
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

" now that we have the plugin installed prepend this block in the status line
set statusline^=%{FugitiveStatusline()} " vim-fugitive plugin for git branch
set statusline^=%#PmenuSel# " see :help hitest for colors

" open fzf hotkey
map <C-p> :Files<CR>
" <leader>s for Rg search
noremap <leader>s :Rg<Return>
let g:fzf_layout = { 'window': { 'width': 1.0, 'height': 0.5, 'relative': v:true, 'yoffset': 1.0, 'border': 'none' } }

colorscheme acme
set background=light
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" go
let g:go_gopls_gofumpt = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_variable_assignments = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_diagnostic_errors = 1
let g:go_highlight_diagnostic_warnings = 1
let g:go_auto_type_info = 1 " forces 'Press ENTER' too much
let g:go_auto_sameids = 0
let g:go_metalinter_command = "golangci-lint"
let g:go_metalinter_deadline = "5s"
let g:go_metalinter_autosave = 0
let g:go_jump_to_error = 0
let g:go_metalinter_autosave_enabled = []
let g:go_metalinter_enabled = []
let g:go_list_autoclose = 1
au FileType go nmap <leader>r :GoRename!<CR>
au FileType go nmap <leader>t :GoTest!<CR>
au FileType go nmap <leader>v :GoVet!<CR>
au FileType go nmap <leader>b :GoBuild!<CR>
au FileType go nmap <leader>c :GoCoverageToggle<CR>
au FileType go nmap <leader>i :GoInfo<CR>
au FileType go nmap <leader>l :GoMetaLinter!<CR>
au FileType go nmap <leader>e :GoIfErr<CR>

" dart
let g:dart_style_guide = 2
let g:dart_format_on_save = 1
let g:dart_trailing_comma_indent = v:true

let b:project_nav_root_markers = ['pubspec.yaml']
let g:lsc_dart_sdk_path = "~/.flutter-git"
let g:lsc_auto_map = {
    \ 'GoToDefinition': 'gd',
    \ 'FindReferences': 'gr',
    \ 'FindImplementations': 'gI',
    \ 'FindCodeActions': 'ga',
    \ 'Rename': '<leader>r',
    \ 'ShowHover': v:true,
    \ 'DocumentSymbol': 'go',
    \ 'Completion': 'completefunc',
    \}

" vimtex
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
let g:tex_conceal='abdmg'
let maplocalleader = ","
set conceallevel=2
