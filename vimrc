set nocompatible
filetype off

" PLUGINS
" =======

" Vundle start plugin
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Vundle is short for Vim bundle and is a Vim plugin manager. REQUIRED.
Plugin 'VundleVim/Vundle.vim'

" File system explorer for the Vim editor.
Plugin 'scrooloose/nerdtree'

" Colorschemes plugins
Plugin 'jsenin/molokai'
Plugin 'romainl/Apprentice'

" Lean & mean status/tabline for vim that's light as air.
Plugin 'bling/vim-airline'

" https://github.com/ctrlpvim/ctrlp.vim
" Full path fuzzy file, buffer, mru, tag, ... finder for Vim.
Plugin 'ctrlpvim/ctrlp.vim'

" https://github.com/jiangmiao/auto-pairs
" Insert or delete brackets, parens, quotes in pair.
Plugin 'jiangmiao/auto-pairs'

" https://github.com/majutsushi/tagbar
" provides an easy way to browse the tags of the current file and get an overview of its structure.
" https://andrew.stwrt.ca/posts/vim-ctags/
Plugin 'majutsushi/tagbar'

" https://github.com/easymotion/vim-easymotion
" Simpler way to use some motions in vim
Plugin 'easymotion/vim-easymotion'

" https://github.com/w0rp/ale
" Linting while you edit your text files.
Plugin 'w0rp/ale'

" https://github.com/tpope/vim-commentary
" Comment stuff out.
Plugin 'tpope/vim-commentary'

" https://github.com/Vimjas/vim-python-pep8-indent
" A nicer Python indentation style
Plugin 'hynek/vim-python-pep8-indent'

" https://github.com/airblade/vim-gitgutter
" Shows a git diff in the 'gutter' (sign column). It shows whether each line has been added, modified, and where lines have been removed.
Plugin 'airblade/vim-gitgutter'

" https://github.com/mileszs/ack.vim
" Run your favorite search tool from Vim, with an enhanced results list.
Plugin 'mileszs/ack.vim'

" https://github.com/kshenoy/vim-signature
" Place, toggle and display marks.
Plugin 'kshenoy/vim-signature'

" https://github.com/Shougo/neocomplete.vim
" Keyword completion system by maintaining a cache of keywords in the current buffer.
Plugin 'Shougo/neocomplete.vim'
Plugin 'Shougo/neosnippet'
Plugin 'Shougo/neosnippet-snippets'

" https://github.com/tpope/vim-sensible
" A universal set of defaults that (hopefully) everyone can agree on.
Plugin 'tpope/vim-sensible'

" https://github.com/tpope/vim-fugitive
" A Git wrapper so awesome, it should be illegal
Plugin 'tpope/vim-fugitive'

" https://github.com/tpope/vim-rhubarb
" GitHub extension for fugitive.vim
Plugin 'tpope/vim-rhubarb'

" https://github.com/fatih/vim-go
" Go development plugin for Vim
Plugin 'fatih/vim-go'

" https://github.com/junegunn/vim-emoji
" Emojis support
Plugin 'junegunn/vim-emoji'

" All of your Plugins must be added before the following line
call vundle#end() " required

" CONFIGURATIONS
" ==============

set clipboard=unnamed         " Use system clipboard
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif
filetype plugin indent on         " Automatically detect file types.
syntax on                         " Syntax highlighting
set mouse=a                       " Automatically enable mouse usage
set mousehide                     " Hide the mouse cursor while typing
scriptencoding utf-8
set nowrap                        " Do not wrap long lines
set autoindent                    " Indent at the same level of the previous line
set expandtab                     " Tabs are spaces, not tabs
set tabstop=2                     " An indentation every four columns
set softtabstop=2                 " Let backspace delete indent
set shiftwidth=2                  " Use indents of 4 spaces
set ignorecase                    " Case insensitive searches
set hlsearch                      " Highlight search results
set incsearch
set cursorline
set t_Co=256
syntax enable
set background=dark
colorscheme apprentice 
set number                        " show line number
set foldmethod=indent
set foldlevel=99
set completefunc=emoji#complete   " emojis completion
set omnifunc=emoji#complete

let g:semanticEnableFileTypes = ['python']

" Application expecific configuration
" ==================================

" Tagbar configuration
" autocmd FileType * nested :call tagbar#autoopen()
let g:tagbar_autofocus = 1
let g:tagbar_compact = 1

" ALE configuration
let g:ale_linters = {
\   'python': ['pylint'],
\}
highlight ALEErrorSign ctermbg=234 ctermfg=9
highlight ALEError ctermfg=234 cterm=underline
highlight ALEWarningSign ctermbg=234 ctermfg=226
let g:ale_sign_error = '✖'
let g:ale_sign_warning = '⚠'
let g:ale_set_highlights = 0

" Airline configuration
let g:airline#extensions#ale#enabled = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.whitespace = 'Ξ'

" Neocomplete configuration
let g:neocomplete#enable_at_startup = 1
" <TAB>: completion.
  inoremap <expr><TAB>  pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ neocomplete#start_manual_complete()
  function! s:check_back_space() "{{{
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
  endfunction"}}}

" NERDTree configuration
let NERDTreeIgnore=['\.pyc$', '\.orig$']

" KEYS MAPPINGS
" =============

let mapleader = ','
noremap <c-X> :NERDTreeToggle<CR>
noremap <c-A> :TagbarToggle<CR>
noremap <c-F> :NERDTreeFind<CR>
nnoremap <Leader>z gT
nnoremap <Leader>x gt
vnoremap <Leader>c gc
nnoremap <Leader>p :set paste<CR>
nnoremap <Leader>a :ALEToggle<CR>
nnoremap <Leader>n :noh<CR>
nnoremap <Leader>h :split<CR>
nnoremap <Leader>v :vsplit<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>y yiw                             " yank cursor word
nnoremap <Leader>r viw"0p                          " replace cursor word with yanked word
nnoremap <Leader>d :NERDTreeToggle<CR>             " opens/closes NerdTree
nnoremap <Leader>f za                              " fold toggle
nnoremap <Leader>l :lopen<CR>                      " opens linter errors and warnings window
nnoremap -l :lnext<CR>                             " jumps to next linter message
nnoremap _L :lprev<CR>                             " jumps to previous linter message
nnoremap _l :lprev<CR>                             " jumps to previous linter message
vmap  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
noremap <Leader>t =                               " formats selected text
nnoremap <leader>1 :Ack! '\b<cword>\b'<cr>
nnoremap <leader>2 :Ack! <cword> <cr>

" Switch between splitted windows
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

command U :normal i# -*- coding: utf-8 -*-
command M :normal iif __name__ == '__main__':
