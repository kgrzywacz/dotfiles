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
Plugin 'flazz/vim-colorschemes'
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
colorscheme solarized
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

let g:lightline.component_expand = {
      \  'linter_checking': 'lightline#ale#checking',
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \ }

let g:lightline.component_type = {
      \     'linter_checking': 'left',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \     'linter_ok': 'left',
      \ }

let g:lightline.active = { 'right': [[ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ]] }

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


" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
" nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
" nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
" nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
" nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
" nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
" nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
" nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
" nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

command! -nargs=0 Prettier :CocCommand prettier.formatFile
