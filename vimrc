""""""""""""""""""""""
" conventions source "
""""""""""""""""""""""
" https://soporte.alea-soluciones.com/a/solutions/articles/12000075675


""""""""""""""""""""""""
" global configuration "
""""""""""""""""""""""""
let mapleader = ',' " Map leader key to comma

set number " Show line number
set encoding=utf-8 " utf-8 encoding
set nocompatible
filetype off
syntax on " Syntax coloring
filetype plugin indent on " filetype detection
set ttyfast " Improves scroll performance

" Remove swap files in vim
set noswapfile
set nobackup
set nowb

" Indentation
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab
set expandtab
set autoindent

" folding
set foldmethod=indent
set foldlevel=99
nnoremap <space> za
vnoremap <space> za

" tabs
nnoremap <Leader>t <Esc>:tabnew<CR>

" search
set hlsearch " Highlight search matches
set incsearch " Incremental search
nnoremap <silent> <C-l> :nohl<CR><C-l> " <Ctrl-l> redraws the screen and removes any search highlighting.


"""""""""""
" Plugins "
"""""""""""

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'preservim/nerdtree'
Plugin 'fatih/vim-go'
Plugin 'ctrlpvim/ctrlp.vim' " Ctrl + P
Plugin 'tpope/vim-commentary' " block comment with gc shortcut
Plugin 'hynek/vim-python-pep8-indent' " A nicer Python indentation style


"""""""""""""""""""""""""
" Plugins configuration "
"""""""""""""""""""""""""

" NERDTree
map <C-x> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
nnoremap <Leader>s :NERDTreeFind<CR>
let NERDTreeIgnore = ['\.pyc$', '\.orig$', '\.egg-info', '__pycache__', '\.sw*$', '\.swp'] " Ignore files
let NERDTreeShowHidden=1

" vim-go
let g:go_fmt_command = "goimports" " Default golang formater

" ctrlP
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn|pyc))$'

"""""""""""""
" functions "
"""""""""""""

" Remove all trailing spaces on save
" http://vimcasts.org/episodes/tidying-whitespace
function! Preserve(command)
    let _s=@/
    let l = line(".")
    let c = col(".")
    execute a:command
    let @/=_s
    call cursor(l, c)
endfunction


""""""""""""""""""""""
" automatic commands "
""""""""""""""""""""""

autocmd BufWritePre * :call Preserve("%s/\\s\\+$//e")

source ~/.vimrc_extended
