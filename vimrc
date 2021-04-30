"
"""""""""""""""""""""""""""""""""""""""""
"""""""""" VIM SETTINGS BELOW: """"""""""
"""""""""""""""""""""""""""""""""""""""""

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'NikolayFrantsev/jshint2.vim'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'elixir-editors/vim-elixir'
Plugin 'altercation/vim-colors-solarized'
Plugin 'itchyny/lightline.vim'
Plugin 'jeffkreeftmeijer/vim-numbertoggle'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'junegunn/vader.vim'
Plugin 'kgrzywacz/ale'
Plugin 'kgrzywacz/vim-force.com'
Plugin 'maximbaz/lightline-ale'
Plugin 'scrooloose/nerdcommenter'
Plugin 'sirver/UltiSnips'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-vinegar'
Plugin 'hashivim/vim-terraform'
Plugin 'martinda/Jenkinsfile-vim-syntax'
Plugin 'othree/xml.vim'
Plugin 'neoclide/coc.nvim'
Plugin 'ayu-theme/ayu-vim'

call vundle#end()
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

"""""SOLARAIZED:
colorscheme ayu
set background=dark

"""""VIM_FORCE:

if has("unix")
	let g:apex_tooling_force_dot_com_path = "/Users/kamil/dev/libs/tooling-force.com.jar"
	let g:apex_conflict_check = 0
	let g:apex_API_version = "44.0"
	if !exists("g:apex_backup_folder")
		let g:apex_backup_folder = "/Users/kamil/dev/vim-force.com/backup"
	endif
	if !exists("g:apex_temp_folder")
		" full path required here, relative may not work
		let g:apex_temp_folder="/Users/kamil/dev/vim-force.com/temp"
	endif
	if !exists("g:apex_properties_folder")
		" full path required here, relative may not work
		let g:apex_properties_folder="/Users/kamil/dev/salesforce/.settings"
	endif
	if !exists("g:apex_workspace_path")
		" full path required here, relative may not work
		let g:apex_workspace_path="/Users/kamil/dev/salesforce"
	endif
	if !exists("g:apex_test_logType")
		let g:apex_test_logType="Debugonly"
	endif
	let g:apex_ctags_cmd="/usr/local/bin/ctags"
endif

autocmd Filetype page setlocal ts=2 sw=2 sts=0
autocmd VimResized * wincmd =
let g:apex_server=1 " start server on first call
let g:apex_server_timeoutSec=60*60 " allow server to wait for new connections within 30 minutes


""""""""""""""""""""""""""""""""""""""
"""""""""" CUSTOM MAPPINGS: """"""""""
""""""""""""""""""""""""""""""""""""""
":nnoremap <leader>n :e.<CR>
:nnoremap <leader>n :Ex<CR>
:nnoremap <leader>aso :w<CR>:ApexSaveOne!<CR>
:nnoremap <leader>asd :wa<CR>:ApexDeployStaged!<CR>y<CR>
:nnoremap <leader>sc :noautocmd vimgrep /\<<C-R><C-W>\>/j ../**/*.cls ../**/*.trigger <CR>:cwin<CR>
:nnoremap <leader>sal :noautocmd vimgrep /\<<C-R><C-W>\>/j ../**/* <CR>:cwin<CR>
:nnoremap <leader>st :noautocmd vimgrep /\<<C-R><C-W>\>/j ../**/*.trigger <CR>:cwin<CR>
:nnoremap <leader>sp :noautocmd vimgrep /\<<C-R><C-W>\>/j ../**/*.page <CR>:cwin<CR>
:nnoremap <leader>ss :noautocmd vimgrep /\<<C-R><C-W>\>/j ../**/*.scf <CR>:cwin<CR>
" :nnoremap <leader>sa :noautocmd vimgrep /\<<C-R><C-W>\>/j ../**/*.cls ../**/*.trigger ../**/*.page ../**/*.scf <CR>:cwin<CR>
:nnoremap <leader>sa :noautocmd grep /\<<C-R><C-W>\>/j ../**/* <CR>:cwin<CR>
:nnoremap <leader>ob :FufBuffer<CR>
":nnoremap <expr> <leader>p ":CtrlP ". split(expand('%:p'), 'src')[0]. "<CR>"
:nnoremap <leader>, :bp<CR>
:nnoremap <leader>. :bn<CR>
:nnoremap <leader>sa :ApexStageAdd<CR>
:nnoremap <leader>as :ApexSearch <C-R>=expand("<cword>")<CR><CR>
:inoremap jk <esc>

:nnoremap <C-J> <C-W><C-J>
:nnoremap <C-K> <C-W><C-K>
:nnoremap <C-L> <C-W><C-L>
:nnoremap <C-H> <C-W><C-H>
:nnoremap <C-b> :Buffers<CR>
:nnoremap <C-p> :GFiles<CR>
:nnoremap <leader>ev :split $MYVIMRC<CR>
:nnoremap <leader>sv :source $MYVIMRC<CR>
:nnoremap <leader>s :let @a=@+ \| :let @+=@" \| :let @"=@a<CR>
:nnoremap <leader>w :w<CR>
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
""""""""""""""""""""""""""""""""""""""
"""""""""" CUSTOM COMMANDS: """"""""""
""""""""""""""""""""""""""""""""""""""

cabbrev W w
cabbrev WQ wq
cabbrev Wq wq
cabbrev Q q
cabbrev E e
cabbrev Ads ApexDeployStaged!
command! -nargs=+ ApexSearch exec 'silent grep! -iIRF --exclude=\*{-meta.xml,package.xml} --exclude-dir={.git,.vim-force.com} <args> ../..' | copen | execute 'silent /<args>' | redraw!
command! FormatJson call FormatJson()
command! FormatXml call FormatXml()

function! TransformCSLog()
	exec "%g!/FullName\\/Id/d"
	exec "%g/.*\\..*__.*/d"
	exec "%s/FullName\\/Id: /<members>/g"
	exec "%s/\\/.*/<\\/members>/g"
	exec "%sort u"
	exec "noh"
endfunction

autocmd FileType apexcode nnoremap <buffer> <C-]> :call apexComplete#goToSymbol()<Enter>

let g:netrw_banner=0
let g:netrw_liststyle=1
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+,\(^\|\s\s\)ntuser\.\S\+'
autocmd FileType netrw set nolist number
nnoremap <Leader>x :<C-U>call StripTrailingWhitespace()<CR>


