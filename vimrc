"""""""""""""""""""""""""""""""""""""""""
"""""""""" VIM SETTINGS BELOW: """""""""" 
"""""""""""""""""""""""""""""""""""""""""

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Adds line numbers "
set number

" Make backspace behave in a sane manner.
set backspace=indent,eol,start

" Allows switching from edited buffer without <bang> parameter
set hidden

" Switch syntax highlighting on
syntax on

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

set dir=/Users/kamil/dev/swap-files/

""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""" VIM PLUGIN SEETINGS BELOW: """"""""""
""""""""""""""""""""""""""""""""""""""""""""""""

"""""PATHOGEN:

runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

let html_wrong_comments=1

"""""CTRLP:

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:15,results:50'
let g:ctrlp_custom_ignore = {
			\ 'dir':  '\v[\/]\.(git|hg|svn)$',
			\ 'file': '\-meta\.xml$',
			\ }

"""""SOLARAIZED:
let g:start_hour = system("date +\"%H\"")

set background=dark
if g:start_hour > 20 || g:start_hour < 8
	set background=dark
else 
	set background=light
endif
colorscheme solarized

"""""VIM_FORCE:

if has("unix")
	let g:apex_tooling_force_dot_com_path = "/Users/kamil/jars/tooling-force.com.jar"
	if !exists("g:apex_backup_folder")
		let g:apex_backup_folder = "/Users/kamil/dev/vim-force.com/backup"
	endif
	if !exists("g:apex_temp_folder")
		" full path required here, relative may not work
		let g:apex_temp_folder="/Users/kamil/dev/vim-force.com/temp"
	endif
	if !exists("g:apex_properties_folder")
		" full path required here, relative may not work
		let g:apex_properties_folder="/Users/kamil/dev/vim-force.com/settings"
	endif
	if !exists("g:apex_workspace_path")
		" full path required here, relative may not work
		let g:apex_workspace_path="/users/kamil/dev/vim-workspace"
	endif
	if !exists("g:apex_test_logType")
		let g:apex_test_logType="Debugonly"
	endif
endif	

autocmd Filetype page setlocal ts=2 sw=2 sts=0
let g:apex_server=1 " start server on first call
let g:apex_server_timeoutSec=60*30 " allow server to wait for new connections within 30 minutes

"""""VIM_AIRLINE:

set laststatus=2
set timeout timeoutlen=1500
let g:airline_powerline_fonts = 1
"let g:airline#extensions#tabline#enabled = 1

"""""ULTISNIPS:
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
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

"""""NERDtree
let g:NERDTreeShowBookmarks = 1

""""""""""""""""""""""""""""""""""""""
"""""""""" CUSTOM MAPPINGS: """"""""""
""""""""""""""""""""""""""""""""""""""

:nnoremap <leader>qs :w<CR>:ApexSaveOne<CR>y<CR>
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
:nnoremap <leader>tg :call SwitchBackground()<CR>
:inoremap jk <esc>

:nnoremap <C-J> <C-W><C-J>
:nnoremap <C-K> <C-W><C-K>
:nnoremap <C-L> <C-W><C-L>
:nnoremap <C-H> <C-W><C-H>
:nnoremap <C-b> :CtrlPBuffer<CR>
:nnoremap <leader>ev :split $MYVIMRC<CR>
:nnoremap <leader>sv :source $MYVIMRC<CR>
:nnoremap <leader>sf :NERDTreeFromBookmark vim-workspace<CR>
:nnoremap <leader>s :let @a=@+ \| :let @+=@" \| :let @"=@a<CR>
:nnoremap <leader>n :NERDTree<CR>
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
:map <space> <leader>
""""""""""""""""""""""""""""""""""""""
"""""""""" CUSTOM COMMANDS: """"""""""
""""""""""""""""""""""""""""""""""""""

cabbrev W w
cabbrev WQ wq
cabbrev Wq wq
cabbrev Q q
cabbrev E e
command! -nargs=1 ApexSearch call ApexSearch(<f-args>)

function! ApexSearch (findme)
	exec 'vim /'.a:findme.'/gj `find .. -type f ! -name "*.resource" ! -name "*.sw*" ! -name ".git"`'
	cwin
endfunction

function! SwitchBackground()
	let &background = (&background == "light" ? "dark" : "light")
endfunction
