"VS Code colour Scheme
colorscheme codedark
" Line numbers
set number
"Text Wrapping
set wrap
let g:coc_disable_startup_warning = 1
"Vim plugins
if filereadable(expand("~/.vimrc.plug"))
	source ~/.vimrc.plug
endif
