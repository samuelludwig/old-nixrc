if has("syntax")
  syntax on
endif

if has("autocmd")
  filetype plugin indent on
endif

set showcmd
set showmatch
set ignorecase
set smartcase
set incsearch
set autowrite
set hidden
set mouse=a
set tabstop=4
set shiftwidth=4
set expandtab
set wrap tw=80
set termguicolors
set scrolloff=5

set directory^=~/.vim/swapfiles
set runtimepath^=~/.vim/pack/git-plugins/start/

" Sets linenumbers
set number relativenumber

set background=light
"set background=dark

"Prettifications
"autocmd vimenter * colorscheme NeoSolarized
autocmd vimenter * colorscheme ayu
"autocmd Colorscheme NeoSolarized :hi Keyword gui=italic cterm=italic
