" Vundle configuration
" ====================

set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" Plugins
" =======

" Colorschemes
Plugin 'romainl/Apprentice'
Plugin 'NLKNguyen/papercolor-theme'

" File system explorer for the Vim editor.
Plugin 'scrooloose/nerdtree'

" Extra syntax and highlight for nerdtree files
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'

" Full path fuzzy file, buffer, mru, tag, ... finder for Vim.
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tacahiroy/ctrlp-funky'

" Insert or delete brackets, parens, quotes in pair.
Plugin 'jiangmiao/auto-pairs'

" Provides an easy way to browse the tags of the current file and get an overview of its structure.
" https://andrew.stwrt.ca/posts/vim-ctags/
Plugin 'majutsushi/tagbar'

" Simpler way to use some motions in vim
Plugin 'easymotion/vim-easymotion'

" Lean & mean status/tabline for vim that's light as air.
Plugin 'bling/vim-airline'

" Linting while you edit your text files.
Plugin 'w0rp/ale'

" Shows a git diff in the 'gutter' (sign column). It shows whether each line has been added, modified, and where lines have been removed.
Plugin 'airblade/vim-gitgutter'

" Comment stuff out.
Plugin 'tpope/vim-commentary'

" A nicer Python indentation style
Plugin 'hynek/vim-python-pep8-indent'

" Run your favorite search tool from Vim, with an enhanced results list.
Plugin 'mileszs/ack.vim'

" Place, toggle and display marks.
Plugin 'kshenoy/vim-signature'

" Keyword completion system by maintaining a cache of keywords in the current buffer.
Plugin 'Shougo/neocomplete.vim'
" Plugin 'Shougo/neosnippet'
" Plugin 'Shougo/neosnippet-snippets'

" A universal set of defaults that (hopefully) everyone can agree on.
Plugin 'tpope/vim-sensible'

" A Git wrapper so awesome, it should be illegal
Plugin 'tpope/vim-fugitive'

" GitHub extension for fugitive.vim
Plugin 'tpope/vim-rhubarb'

" Adds file type glyphs/icons to popular Vim plugins: NERDTree, vim-airline, Powerline, Unite, vim-startify and more
 Plugin 'ryanoasis/vim-devicons'

" All of your Plugins must be added before the following line
call vundle#end() " required

" Defaults
" ========

set clipboard=unnamed                                   " Use system clipboard
if has('unnamedplus')
    set clipboard=unnamed,unnamedplus
endif

filetype plugin indent on                               " Automatically detect file types.
syntax on                                               " Syntax highlighting
set mouse=a                                             " Automatically enable mouse usage
set mousehide                                           " Hide the mouse cursor while typing
scriptencoding utf-8                                    " UTF-8 encoding
set nowrap                                              " Do not wrap long lines
set autoindent                                          " Indent at the same level of the previous line
set expandtab                                           " Tabs are spaces, not tabs
set tabstop=4                                           " An indentation every four columns
set softtabstop=4                                       " Let backspace delete indent
set shiftwidth=4                                        " Use indents of 4 spaces
set ignorecase                                          " Case insensitive searches
set hlsearch                                            " Highlight search results
set incsearch                                           " Incremental searches
set t_Co=256                                            " Enable 256 colors
syntax enable                                           " Enable syntax
set background=dark                                     " Dark background
colorscheme apprentice                                  " Default colorscheme
set number                                              " Show line number
set foldmethod=indent                                   " Fold method
set foldlevel=99                                        " Fold level
set lazyredraw                                          " Improves scroll performance
set ttyfast                                             " Improves scroll performance

" Application especific configuration
" ==================================

" Tagbar configuration
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
set noshowmode                                          " Ale will handle it...

" Neocomplete configuration
"let g:acp_enableAtStartup = 0
"let g:neocomplete#enable_at_startup = 1
"let g:neocomplete#sources#syntax#min_keyword_length = 3
"inoremap <expr><TAB>  pumvisible() ? "\<C-n>" :

" NERDTree configuration
let NERDTreeIgnore=['\.pyc$', '\.orig$']

" Ctrlp Funky configuration
let g:ctrlp_funky_syntax_highlight = 1

" Custom functions
" ================

" Remove all trailing spaces on save
function! Preserve(command)
    let _s=@/
    let l = line(".")
    let c = col(".")
    execute a:command
    let @/=_s
    call cursor(l, c)
endfunction
autocmd BufWritePre * :call Preserve("%s/\\s\\+$//e")

" Toggles column highligting
fu! ToggleCursorcolumn ()
  if &cursorcolumn
    set nocursorcolumn
  else
    set cursorcolumn
  endif
endfunction

" Toggles line highligting
fu! ToggleCursorline ()
  if &cursorline
    set nocursorline
  else
    set cursorline
  endif
endfunction

" Toggles background
fu! ToggleBackground ()
  if &background == "dark"
    set background=light
  else
    set background=dark
  endif
endfunction

" Key binding
" ===========

map <c-X> :NERDTreeToggle<CR>
map <c-Y> :NERDTreeFind<CR>
map <c-A> :TagbarToggle<CR>

let mapleader = ' '
nnoremap <Leader>z gT
nnoremap <Leader>x gt
nnoremap <Leader>a :ALEToggle<CR>
nnoremap <Leader>n :noh<CR>
nnoremap <Leader>h :split<CR>
nnoremap <Leader>v :vsplit<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>y yiw                                  " yank cursor word
nnoremap <Leader>r viw"0p                               " replace cursor word with yanked word
nnoremap <Leader>f za                                   " fold toggle
nnoremap <Leader>l :lopen<CR>                           " opens linter errors and warnings window
nnoremap <Leader>u g~iw                                 " toggles uppercase for word on cursor
nnoremap <Leader>g :Gbrowse<CR>                         " Opens browser with github page for file
nnoremap <Leader>c :call ToggleCursorcolumn()<CR>
nnoremap <Leader>l :call ToggleCursorline()<CR>
set pastetoggle=<leader>p

nnoremap -l :lnext<CR>                                  " jumps to next linter message
nnoremap -k :lprev<CR>                                  " jumps to previous linter message
vmap  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
nnoremap <c-1>1 :Ack! '\b<cword>\b'<CR>
nnoremap <c-2>2 :Ack! <cword> <CR>
noremap <c-F> :CtrlPFunky<CR>

" Switch between splitted windows
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

" Custom commands
" ===============

command U :normal i# -*- coding: utf-8 -*-
command M :normal iif __name__ == '__main__':
command P pwd
command FN echo expand('%:t')                           " Display file name
command FP echo expand('%:p')                           " Display file full path
command SKIPIT %s/it(/_it(/g                            " Skip mamba tests
command UNSKIPIT %s/_it(/it(/g                          " Unskip mamba tests
command BG call ToggleBackground()
command VIMRC so %
