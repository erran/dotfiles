" [note] - This .vimrc minifies some settings from thoughtbot's dotfiles repo

" Set shell to avoid command failures due to fish
set shell=/bin/bash
set number
set relativenumber
set numberwidth=1
set tabstop=2
set shiftwidth=2
set expandtab
" The Rapid7 coding standards are 3 spaces for Java files.
autocmd FileType java set tabstop=3
autocmd FileType java set shiftwidth=3
" The AppSpider coding standards are hardtabs for PHP files.
autocmd FileType php set tabstop=1
autocmd FileType php set shiftwidth=1
autocmd FileType php set autoindent
autocmd FileType php set noexpandtab
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
"set list listchars=tab:»·,trail:·

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
map <Leader>/ <Leader>c<space><cr>
cnoreabbrev <expr> W ((getcmdtype() is# ':' && getcmdline() is# 'W')?('w'):('W'))

" Vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-ruby/vim-ruby'
Plugin 'croaky/vim-colors-github'
Plugin 'kien/ctrlp.vim'
Plugin 'reedes/vim-colors-pencil'
Plugin 'itchyny/lightline.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'mhinz/vim-startify'
Plugin 'kchmck/vim-coffee-script'
Plugin 'hwartig/vim-seeing-is-believing'
Plugin 'flazz/vim-colorschemes'
Plugin 'blankname/vim-fish'
Plugin 'hashivim/vim-terraform'
Plugin 'dhruvasagar/vim-zoom'
Plugin 'fatih/vim-go'

call vundle#end()
filetype plugin indent on

set statusline+=%{zoom#statusline()}

" autocmd FileType cucumber setlocal spell
autocmd FileType markdown setlocal spell
au BufNewFile,BufRead *.gradle setf groovy
au BufNewFile,BufRead *.ejs setf html
au BufNewFile,BufRead Cloudfile setf ruby

" Style/theme
colorscheme darkblue
set background=dark "light
set t_ut=
colorscheme monokai

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'component': {
      \   'readonly': '%{&readonly?"":""}',
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }

autocmd BufNewFile,BufRead Dogfile set filetype=ruby

autocmd FileType ruby nmap <buffer> <Leader>r <Plug>(seeing-is-believing-run)
autocmd FileType ruby xmap <buffer> <Leader>r <Plug>(seeing-is-believing-run)

autocmd FileType ruby nmap <buffer> <Leader>s <Plug>(seeing-is-believing-mark)
autocmd FileType ruby xmap <buffer> <Leader>s <Plug>(seeing-is-believing-mark)

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
"vnoremap <C-r> :grep! @.<CR>

command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!

function HelmSyntax()
  set filetype=yaml
  unlet b:current_syntax
  syn include @yamlGoTextTmpl syntax/gotexttmpl.vim
  let b:current_syntax = "yaml"
  syn region goTextTmpl start=/{{/ end=/}}/ contains=@gotplLiteral,gotplControl,gotplFunctions,gotplVariable,goTplIdentifier containedin=ALLBUT,goTextTmpl keepend
  hi def link goTextTmpl PreProc
endfunction
augroup helm_syntax
  autocmd!
  autocmd BufRead,BufNewFile */templates/*.yml,*/templates/*.yaml,*/templates/*.tpl call HelmSyntax()
augroup END
