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
