"
"""""""""""""""""""""""""""""""""""""""""
"""""""""" VIM SETTINGS BELOW: """"""""""
"""""""""""""""""""""""""""""""""""""""""

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

Plug 'cakebaker/scss-syntax.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'altercation/vim-colors-solarized'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-vinegar'
Plug 'hashivim/vim-terraform'
Plug 'martinda/Jenkinsfile-vim-syntax'
Plug 'othree/xml.vim'
Plug 'neoclide/coc.nvim'
Plug 'neowit/vim-force.com'
Plug 'catppuccin/vim', { 'as': 'catppuccin' }

call plug#end()
" Adds line numbers "
set number


set encoding=utf-8
" Make backspace behave in a sane manner.
set backspace=indent,eol,start

" Allows switching from edited buffer without <bang> parameter
set hidden

" Switch syntax highlighting on
syntax on
syntax enable

" Enable file type detection and do language-dependent indenting
filetype plugin indent on

" Sets every tab length to 4 characters
set tabstop=4
set shiftwidth=4
set softtabstop=4

set completeopt=menu,preview,longest
"set omnifunc=syntaxcomplete#Complete
" Highlights search matches
set hlsearch

"Turn off case sensitivity in search:
set ignorecase
"set relativenumber
set gdefault
set wildmenu
set wildmode=full

"If there is at least one capital letter in search, then search will be
"automagically case sensitive:
set smartcase

" Highlights current line
set cursorline

" Sets working direcotry to current file's dir
set autochdir

" Change <leader> to , char
"let mapleader="\"

set splitbelow
set splitright

set dir^=$HOME/.vim/swapfiles//
set clipboard=unnamed


""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""" VIM PLUGIN SEETINGS BELOW: """"""""""
""""""""""""""""""""""""""""""""""""""""""""""""

"""""THEME:
"if (has("termguicolors"))
	"let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
	"let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
"endif
colorscheme catppuccin_mocha
set termguicolors
"set t_Co=16


""""""""""""""""""""""""""""""""""""""
"""""""""" CUSTOM MAPPINGS: """"""""""
""""""""""""""""""""""""""""""""""""""
":nnoremap <expr> <leader>p ":CtrlP ". split(expand('%:p'), 'src')[0]. "<CR>"
:nnoremap <leader>, :bp<CR>
:nnoremap <leader>. :bn<CR>
:inoremap jk <esc>

:nnoremap <C-J> <C-W><C-J>
:nnoremap <C-K> <C-W><C-K>
:nnoremap <C-L> <C-W><C-L>
:nnoremap <C-H> <C-W><C-H>
:nnoremap <C-b> :Buffers<CR>
:nnoremap <C-p> :GFiles<CR>
:nnoremap <leader>ev :split $MYVIMRC<CR>
:nnoremap <leader>sv :source $MYVIMRC<CR>
:nnoremap H 0
:vnoremap H 0
:onoremap H 0
:nnoremap L $
:vnoremap L $
:onoremap L $
:inoremap <left> <nop>
:inoremap <up> <nop>
:inoremap <right> <nop>
:inoremap <down> <nop>
:nnoremap <left> <nop>
:nnoremap <up> <nop>
:nnoremap <right> <nop>
:nnoremap <down> <nop>
:nnoremap Q <nop>
xnoremap . :norm.<CR>
nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'
:map <space> <leader>


function! FormatJson()
	:%!python3 -m json.tool
endfunction
""""""""""""""""""""""""""""""""""""""
"""""""""" CUSTOM COMMANDS: """"""""""
""""""""""""""""""""""""""""""""""""""

cabbrev W w
cabbrev WQ wq
cabbrev Wq wq
cabbrev Q q
cabbrev E e
command! FormatJson call FormatJson()
command! FormatXml call FormatXml()

let g:netrw_banner=0
let g:netrw_liststyle=0
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+,\(^\|\s\s\)ntuser\.\S\+'
autocmd FileType netrw set nolist number
nnoremap <Leader>x :<C-U>call StripTrailingWhitespace()<CR>

let g:fzf_preview_window = ['up:40%:hidden', 'ctrl-/']
 
let g:terraform_fmt_on_save = 1
