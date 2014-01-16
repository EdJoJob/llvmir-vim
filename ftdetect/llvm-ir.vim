" use correct filetype and syntax
augroup filetype
	au!
	au BufRead,BufNewFile *.pll\|ll set filetype=llvm
augroup END

