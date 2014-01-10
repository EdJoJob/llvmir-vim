" folding function for LLVM-IR
function! LLVMFolds()
	let thisline = getline(v:lnum)
	let nextline = getline(v:lnum + 1)

	if match(thisline, '^@') == 0 && foldlevel(v:lnum - 1) <= 0
		return ">1"
	elseif match(thisline, '^%') == 0 && foldlevel(v:lnum - 1) <= 0
		return ">1"
	" matches lables
	elseif match(thisline, '^[-a-zA-Z$._][-a-zA-Z$._0-9]*:') >= 0
		return ">2"
	elseif match(nextline, '^\}$') >= 0
		return "<2"
	elseif match(thisline, '^\}$') >= 0
		return "<1"
	elseif match(thisline, '{$') >= 0
		return ">1"
	elseif match(nextline, '^$') >= 0
		if match(thisline, '^@') == 0 && foldlevel(v:lnum - 1) == 1
			return "<1"
		elseif match(thisline, '^%') >= 0 && foldlevel(v:lnum - 1) == 1
			return "<1"
		else
			return "="
		endif
	else
		return "="
	endif
endfunction
setlocal foldmethod=expr
setlocal foldexpr=LLVMFolds()
