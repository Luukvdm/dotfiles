" General
" ========
syntax on
filetype off
set nocompatible
set shell=bash
set tw=0
set clipboard=unnamedplus
set backspace=indent,eol,start
set clipboard+=unnamedplus
set nowrap
set number
set ruler
set autochdir
set nojoinspaces
set hlsearch
set incsearch
set showcmd
set modeline
" set wildmenu

" set guicursor=
set guicursor=n-v-c-sm-r:block,i-ci-ve:ver25-Cursor-blinkwait300-blinkon200-blinkoff150

" set textwidth=72
set tabstop=8 
set softtabstop=0
set noexpandtab
set shiftwidth=4
set smarttab
set autoindent

" Autostart NERDTree
" autocmd vimenter * NERDTree

" Open URLs using desktop browser.
if has('gui_gtk2')
    if has('gui_running')
        " Workaround for https://bugzilla.xfce.org/show_bug.cgi?id=12251
        let g:netrw_browsex_viewer="setsid xdg-open"
    else
        let g:netrw_browsex_viewer="xdg-open"
    endif
endif

" Code
" ========
autocmd FileType python nnoremap <buffer> <F5> :w<CR>:exec '!python' shellescape(@%, 1)<cr>
autocmd FileType sh nnoremap <buffer> <F5> :w<CR>:exec '!bash'       shellescape(@%, 1)<cr>
autocmd FileType cs nnoremap <buffer> <F5> :w<CR>:exec '!dotnet run' shellescape(@%,1)<cr>

autocmd BufNewFile,BufRead *.md, *.txt set filetype=markdown
autocmd BufNewFile,BufRead *.html,*.css,*.js,*.json,*.yml,*.yaml,*.xml setlocal tabstop=2 shiftwidth=2
autocmd BufNewFile,BufRead *.go,Makefile,*.cs,*.py,*.java setlocal tabstop=4 shiftwidth=4 noexpandtab

" Highlight TODO in any file.
autocmd BufWinEnter * syntax keyword Todo TODO

" Highlight trailing whitespace as error.
autocmd BufWinEnter * syntax match Error /\s\+$/

" Key mappings
" ========
" Write buffer
nnoremap <C-S> :w<CR>

" Commands
" ========
" :Rm -> Remove current file.
command! Rm bp | bd! # | call delete(expand('#'))

" :Mv {file} -> Rename current file.
command! -nargs=1 Mv saveas <args> | bd! # | call delete(expand('#'))

" :wide :wider :widest -> Different window sizes.
command! Wide vertical resize 78
command! Wider vertical resize 86
command! Widest vertical resize 126

" Vundle
" ========
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'morhetz/gruvbox'
Plugin 'VundleVim/Vundle.vim'
" Plugin 'ycm-core/YouCompleteMe'
Plugin 'sheerun/vim-polyglot'
Plugin 'scrooloose/nerdtree'

" Snippets
Plugin 'Shougo/deoplete.nvim'
if !has('nvim')
  Plugin 'roxma/nvim-yarp'
  Plugin 'roxma/vim-hug-neovim-rpc'
endif

Plugin 'Shougo/neosnippet.vim'
Plugin 'Shougo/neosnippet-snippets'
" Plugin 'honza/vim-snippets'

call vundle#end()
filetype plugin indent on

" Enable deoplete
let g:deoplete#enable_at_startup = 1

" Neosnippet confi

" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif
