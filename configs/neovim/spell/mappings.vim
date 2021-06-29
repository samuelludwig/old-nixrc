" Set current buffer to maxsize, minimizing all others
nmap <Leader>rs :resize<CR>

" Toggle background color between light and dark
if exists("*ToggleBackground") == 0
    function ToggleBackground()
        if &background == "dark"
            set background=light
        else
            set background=dark
        endif
    endfunction
endif

nmap <Leader>b :call ToggleBackground()<CR>

autocmd FileType php nmap <buffer> <Leader>; :execute "normal! mqA;\esc`q"


""""""""""""""""""""""""""""
" Ranger style marks command
""""""""""""""""""""""""""""
function! Marks()
    marks
    echo('Mark: ')

    " getchar() - prompts user for a single character and returns the chars
    " ascii representation
    " nr2char() - converts ASCII `NUMBER TO CHAR'

    let s:mark = nr2char(getchar())
    " remove the `press any key prompt'
    redraw

    " build a string which uses the `normal' command plus the var holding the
    " mark - then eval it.

    execute "normal! '" . s:mark
endfunction

nnoremap ' :call Marks()<CR>

" Telescope binds
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Make omnifunc useable
inoremap <C-C> <C-X><C-O>
