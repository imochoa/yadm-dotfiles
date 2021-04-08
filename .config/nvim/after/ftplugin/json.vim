" vim: filetype=vim

" autocmd FileType json :setlocal foldmethod=syntax
set foldmethod=syntax
" set tabstop=4
" set softtabstop=4
" set shiftwidth=4
" set textwidth=79

" " JSON has no comments.
" setlocal comments=
" setlocal commentstring=


" Comments in JSON files
autocmd FileType json syntax match Comment +\/\/.\+$+
