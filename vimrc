" Set shell to avoid command failures due to fish
set shell=/bin/bash

" [note] - This .vimrc minifies some settings from thoughtbot's dotfiles repo

set number
set tabstop=2
set shiftwidth=2
set expandtab
set nocompatible
set nobackup
set nowritebackup
set noswapfile
set history=50
set ruler
set showcmd
set incsearch
set laststatus=2
set autowrite
set splitbelow
set splitright
set list listchars=tab:»·,trail:·

" Tab completion
set wildmode=list:longest,list:full
set complete=.,w,t
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>

if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

" Vundle
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive'
Bundle 'vim-ruby/vim-ruby'
Bundle 'croaky/vim-colors-github'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/syntastic'
Bundle 'reedes/vim-colors-pencil'

" [todo] - why doesn't this work? :(
"if filereadable(expand("~/.vimrc.bundles"))
"  source ~/.vimrc.bundles
"endif

filetype plugin indent on

" Enable arrow keys
nnoremap <Left> h
nnoremap <Right> l
nnoremap <Up> k
nnoremap <Down> j

if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif

colo pencil
set background=dark
