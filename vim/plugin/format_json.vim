function! FormatJson()
	:%!python -m json.tool
endfunction
