augroup filetypedetect
  " Git commit message
  autocmd Filetype gitcommit setlocal spell tw=72 colorcolumn=73
  " Shorter columns in text
  autocmd Filetype tex setlocal spell tw=80 colorcolumn=81
  autocmd Filetype text setlocal spell tw=72 colorcolumn=73
  autocmd Filetype markdown setlocal spell tw=72 colorcolumn=73
  " clang format
  autocmd FileType c,cpp ClangFormatAutoEnable
augroup END

