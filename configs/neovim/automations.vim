" Turn on folding for every newly opened file
augroup folding
  autocmd!
  autocmd WinNew * set foldmethod=marker
augroup END

" Remove all trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e 
