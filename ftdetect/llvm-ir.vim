" use correct filetype and syntax
augroup filetype
	au!
	au BufRead,BufNewFile *.ll set filetype=llvm
augroup END

