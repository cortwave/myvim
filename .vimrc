if &shell =~# 'fish$'
    set shell=sh
endif

set nocompatible
syntax on
filetype off

call plug#begin('~/.vim/plugged')
" Put your plugins here.
Plug 'ctrlpvim/ctrlp.vim'
Plug 'valloric/youcompleteme'
call plug#end()
filetype plugin indent on

" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

if executable('rg')
  let g:ctrlp_user_command = 'rg %s --files --hidden --color=never --glob ""'
endif

let g:ycm_global_ycm_extra_conf = ".vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"
