" VIM SETTINGS BELOW:

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Adds line numbers "
set number

" Make backspace behave in a sane manner.
set backspace=indent,eol,start

" Allows swtiching from edited buffer without <bang> parameter
set hidden

" Switch syntax highlighting on
syntax on

" Enable file type detection and do language-dependent indenting
filetype plugin indent on

" Sets every tab length to 4 characters
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" Sets working direcotry to current file's dir
set autochdir

" Change <leader> to , char
let mapleader=","

"Turn off case sensitivity in search:
set ignorecase

"If there is at least one capital letter in search, then search will be
"automagically case sensitive:
set smartcase
" VIM PLUGIN SEETINGS BELOW:

" Pathogen initialisation:
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

" CtrlP settings:
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" Solarized Theme plugin settings:
set background=dark
" set background=light
colorscheme solarized

" vim-force.com plugin settings:
if has("unix")
    let g:apex_tooling_force_dot_com_path = "/Users/kamil/jars/tooling-force.com.jar"
    if !exists("g:apex_backup_folder")
        let g:apex_backup_folder = "/Users/kamil/sfdev/backup"
    endif
 	if !exists("g:apex_temp_folder")
 		" full path required here, relative may not work
 		let g:apex_temp_folder="/Users/kamil/sfdev/temp"
 	endif
 	if !exists("g:apex_properties_folder")
 		" full path required here, relative may not work
 		let g:apex_properties_folder="/Users/kamil/sfdev/settings"
 	endif
 	if !exists("g:apex_workspace_path")
 		" full path required here, relative may not work
 		let g:apex_workspace_path="/Users/kamil/sfdev/workspaces"
 	endif
    if !exists("g:apex_test_logType")
        let g:apex_test_logType="Debugonly"
    endif
endif	

" vim-airline plugin settings:
set laststatus=2
set timeout timeoutlen=1500
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" Ultisnips plugin settings: 
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<c-b>"
let g:UltiSnipsJumpBackwardTrigger = "<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit = "vertical"

" CUSTOM MAPPINGS:
:nmap <leader>qs :w<CR>:ApexSaveOne<CR>y<CR>
:nmap <leader>sc :noautocmd vimgrep /\<<C-R><C-W>\>/j ../**/*.cls ../**/*.trigger <CR>:cwin<CR>
:nmap <leader>st :noautocmd vimgrep /\<<C-R><C-W>\>/j ../**/*.trigger <CR>:cwin<CR>
:nmap <leader>sp :noautocmd vimgrep /\<<C-R><C-W>\>/j ../**/*.page <CR>:cwin<CR>
:nmap <leader>ss :noautocmd vimgrep /\<<C-R><C-W>\>/j ../**/*.scf <CR>:cwin<CR>
:nmap <leader>sa :noautocmd vimgrep /\<<C-R><C-W>\>/j ../**/*.cls ../**/*.trigger ../**/*.page ../**/*.scf <CR>:cwin<CR>
:nmap <leader>ob :FufBuffer<CR>
:nmap <leader>uf :Unite -toggle -start-insert file_rec<CR>
:nmap <leader>ub :Unite -toggle -start-insert buffer<CR>
:nmap <expr> <leader>p ":CtrlP ". split(expand('%:p'), 'src')[0]. "<CR>"
:nmap <leader>, :bp<CR>
:nmap <leader>. :bn<CR>
:inoremap jj <esc>

" CUSTOM COMMANDS:
command! W w
command! Q q
command! E e
command! Reload source ~/.vimrc
