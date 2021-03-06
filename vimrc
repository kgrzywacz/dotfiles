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
Plugin 'tpope/vim-fugitive'
Plugin 'itchyny/lightline.vim'
Plugin 'kgrzywacz/vim-force.com'
Plugin 'scrooloose/nerdcommenter'
Plugin 'sirver/UltiSnips'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'kien/ctrlp.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'jeffkreeftmeijer/vim-numbertoggle'
Plugin 'NikolayFrantsev/jshint2.vim'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
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
set relativenumber
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

set dir=/Users/kamil/dev/vim-swap/
set clipboard=unnamed

""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""" VIM PLUGIN SEETINGS BELOW: """"""""""
""""""""""""""""""""""""""""""""""""""""""""""""

"""""CTRLP:

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:15,results:50'
let g:ctrlp_custom_ignore = {
			\ 'dir':  '\v[\/]\.(git|hg|svn)$',
			\ 'file': '\-meta\.xml$',
			\ }

"""""SOLARAIZED:

colorscheme solarized
let itermProfile = $ITERM_PROFILE
if itermProfile ==  'light'
	set background=light
else
	set background=dark
endif


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

"""""lightline:
let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }

set laststatus=2
set timeout timeoutlen=15000

"""""ULTISNIPS:
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.

let g:UltiSnipsSnippetDirectories=["UltiSnips"]
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<c-b>"
let g:UltiSnipsJumpBackwardTrigger = "<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit = "vertical"

"""""VIM_NOTES:
let g:notes_directories = ['~/Documents/Notes']

let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=254
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=0

let g:ale_linter_aliases = {'apexcode': 'java'}

""""""""""""""""""""""""""""""""""""""
"""""""""" CUSTOM MAPPINGS: """"""""""
""""""""""""""""""""""""""""""""""""""
":nnoremap <leader>n :e.<CR>
:nnoremap <leader>n :NERDTreeFocus<CR>
:nnoremap <leader>aso :w<CR>:ApexSaveOne!<CR>y<CR>
:nnoremap <leader>asd :wa<CR>:ApexDeployStaged!<CR>y<CR>
:nnoremap <leader>sc :noautocmd vimgrep /\<<C-R><C-W>\>/j ../**/*.cls ../**/*.trigger <CR>:cwin<CR>
:nnoremap <leader>sal :noautocmd vimgrep /\<<C-R><C-W>\>/j ../**/* <CR>:cwin<CR>
:nnoremap <leader>st :noautocmd vimgrep /\<<C-R><C-W>\>/j ../**/*.trigger <CR>:cwin<CR>
:nnoremap <leader>sp :noautocmd vimgrep /\<<C-R><C-W>\>/j ../**/*.page <CR>:cwin<CR>
:nnoremap <leader>ss :noautocmd vimgrep /\<<C-R><C-W>\>/j ../**/*.scf <CR>:cwin<CR>
" :nnoremap <leader>sa :noautocmd vimgrep /\<<C-R><C-W>\>/j ../**/*.cls ../**/*.trigger ../**/*.page ../**/*.scf <CR>:cwin<CR>
:nnoremap <leader>sa :noautocmd grep /\<<C-R><C-W>\>/j ../**/* <CR>:cwin<CR>
:nnoremap <leader>ob :FufBuffer<CR>
:nnoremap <expr> <leader>p ":CtrlP ". split(expand('%:p'), 'src')[0]. "<CR>"
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
command! SwitchBG call SwitchBackground()
command! FormatJSON call FormatJSON()

function! SwitchBackground()
	let &background = (&background == "light" ? "dark" : "light")
endfunction

function! TransformCSLog()
	exec "%g!/FullName\\/Id/d"
	exec "%g/.*\\..*__.*/d"
	exec "%s/FullName\\/Id: /<members>/g"
	exec "%s/\\/.*/<\\/members>/g"
	exec "%sort u"
	exec "noh"
endfunction

function! FormatJSON()
	:%!python -m json.tool
endfunction

autocmd FileType apexcode nnoremap <buffer> <C-]> :call apexComplete#goToSymbol()<Enter>
