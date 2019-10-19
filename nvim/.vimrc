" General
set nocompatible
set shell=bash
set tw=0
filetype off
set clipboard=unnamedplus
set backspace=indent,eol,start
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=0
set guicursor=
set clipboard+=unnamedplus

set nowrap
" Autostart NERDTree
autocmd vimenter * NERDTree

" Code
set number
syntax on

" Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'sheerun/vim-polyglot'
Plugin 'scrooloose/nerdtree'

call vundle#end()
filetype plugin indent on

colorscheme peaksea

