" [note] - This .vimrc minifies some settings from thoughtbot's dotfiles repo

" Set shell to avoid command failures due to fish
set shell=/bin/bash
set number
set numberwidth=1
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
set backspace=indent,eol,start
set splitbelow
set splitright
set list listchars=tab:»·,trail:·

" Tab completion
set wildmode=list:longest,list:full
set complete=.,w,t

if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>

" Enable arrow keys
nnoremap <Left> h
nnoremap <Right> l
nnoremap <Up> k
nnoremap <Down> j

nnoremap <C-w>t :tabnew<cr>
nnoremap <C-w>, :tabprevious<cr>
nnoremap <C-w>. :tabnext<cr>
nnoremap <Leader>n :NERDTreeToggle<cr>
map <Leader>/ <Leader>cc<cr>
cnoreabbrev <expr> W ((getcmdtype() is# ':' && getcmdline() is# 'W')?('w'):('W'))

" Vundle
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive'
Bundle 'vim-ruby/vim-ruby'
Bundle 'croaky/vim-colors-github'
Bundle 'kien/ctrlp.vim'
Bundle 'reedes/vim-colors-pencil'
Bundle 'itchyny/lightline.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'mhinz/vim-startify'
Bundle 'kchmck/vim-coffee-script'
Bundle 'hwartig/vim-seeing-is-believing'

filetype plugin indent on

" autocmd FileType cucumber setlocal spell
autocmd FileType markdown setlocal spell

" Style/theme
" colorscheme pencil
colorscheme default
set background=light

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'component': {
      \   'readonly': '%{&readonly?"⭤":""}',
      \ },
      \ 'separator': { 'left': '⮀', 'right': '⮂' },
      \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
      \ }

autocmd FileType ruby nmap <buffer> <Leader>r <Plug>(seeing-is-believing-run)
autocmd FileType ruby xmap <buffer> <Leader>r <Plug>(seeing-is-believing-run)
autocmd FileType ruby imap <buffer> <Leader>r <Plug>(seeing-is-believing-run)

autocmd FileType ruby nmap <buffer> <Leader>s <Plug>(seeing-is-believing-mark)
autocmd FileType ruby xmap <buffer> <Leader>s <Plug>(seeing-is-believing-mark)
autocmd FileType ruby imap <buffer> <Leader>s <Plug>(seeing-is-believing-mark)
