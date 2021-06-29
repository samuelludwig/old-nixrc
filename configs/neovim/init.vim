runtime! debian.vim

nnoremap <Space> <Nop>
let mapleader = " "

source ./plugins.vim
source ./settings.vim
source ./mappings.vim
source ./automations.vim

command! Scratch lua require'lib.core.tools'.makeScratch()
