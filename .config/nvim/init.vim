if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif

call plug#begin(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/plugged"'))
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'sheerun/vim-polyglot'

Plug 'tpope/vim-surround'
Plug 'preservim/nerdtree'
Plug 'junegunn/goyo.vim'
" Plug 'vimwiki/vimwiki'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'bling/vim-airline'
Plug 'kovetskiy/sxhkd-vim'
Plug 'ap/vim-css-color'
call plug#end()

" Enable deoplete
let g:deoplete#enable_at_startup = 1

"" Some general settings
nnoremap c "_c
set nocompatible
filetype plugin on
syntax on
set bg=dark
set encoding=utf-8
set number relativenumber
set shell=bash
set tw=0
set nowrap
set clipboard=unnamedplus
set backspace=indent,eol,start
set clipboard+=unnamedplus
set nojoinspaces

set hlsearch
set incsearch
set showcmd
set modeline

" set guicursor=
set guicursor=n-v-c-sm-r:block,i-ci-ve:ver25-Cursor-blinkwait300-blinkon200-blinkoff150

" set textwidth=72
set tabstop=8 
set softtabstop=0
set noexpandtab
set shiftwidth=4
set smarttab
set autoindent

" Enable autocompletion:
set wildmode=longest,list,full

" Highlighting
autocmd BufWinEnter * syntax keyword Todo TODO

" Disables automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Open URLs using desktop browser.
if has('gui_gtk2')
    if has('gui_running')
        " Workaround for https://bugzilla.xfce.org/show_bug.cgi?id=12251
        let g:netrw_browsex_viewer="setsid xdg-open"
    else
        let g:netrw_browsex_viewer="xdg-open"
    endif
endif


" Goyo plugin makes text more readable when writing prose:
map <leader>f :Goyo \| set bg=dark \| set linebreak<CR>

" Spell-check set to <leader>o, 'o' for 'orthography':
map <leader>o :setlocal spell! spelllang=en_us<CR>

" Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
set splitbelow splitright

" Nerd tree
map <leader>n :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
if has('nvim')
    let NERDTreeBookmarksFile = stdpath('data') . '/NERDTreeBookmarks'
else
    let NERDTreeBookmarksFile = '~/.vim' . '/NERDTreeBookmarks'
endif

"" Filetype stuff
" let g:vimwiki_ext2syntax = {'.Rmd': 'markdown', '.rmd': 'markdown','.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
" map <leader>v :VimwikiIndex
" let g:vimwiki_list = [{'path': '~/vimwiki', 'syntax': 'markdown', 'ext': '.md'}]
autocmd BufNewFile,BufRead *.markdown, *.mdown, *.md, *.txt set filetype=markdown
autocmd BufNewFile,BufRead *.html,*.css,*.js,*.json,*.yml,*.yaml,*.xml setlocal tabstop=2 shiftwidth=2
autocmd BufNewFile,BufRead *.go,Makefile,*.cs,*.py,*.java setlocal tabstop=4 shiftwidth=4 noexpandtab

"" Key mappings
nnoremap <C-S> :w<CR>

" :Mv {file} -> Rename current file.
command! -nargs=1 Mv saveas <args> | bd! # | call delete(expand('#'))

" :wide :wider :widest -> Different window sizes.
command! Wide vertical resize 78
command! Wider vertical resize 86
command! Widest vertical resize 126

" Save file as sudo on files that require root permission
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!


