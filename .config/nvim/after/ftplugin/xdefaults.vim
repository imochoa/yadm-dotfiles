" Vim filetype plugin file
" Language:             X resources files like ~/.Xdefaults (xrdb)
" Previous Maintainer:  Nikolai Weibull <now@bitwi.se>
" Latest Revision:      2008-07-09
" https://github.com/vim/vim/tree/master/runtime/ftplugin

if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

" let s:cpo_save = &cpo
" set cpo&vim

" let b:undo_ftplugin = "setl com< cms< inc< fo<"

" setlocal formatoptions-=t formatoptions+=croql

" let &cpo = s:cpo_save
" unlet s:cpo_save


" Fix comments
" CORRECTED
" https://github.com/tpope/vim-commentary/issues/47
" Correct commenting on .Xdefaults and .Xresources
" autocmd FileType xdefaults setlocal commentstring=!\ %s
" setlocal commentstring=!\ %s
set commentstring=!\ %s
" WRONG
setlocal comments=s1:/*,mb:*,ex:*/,:! commentstring& inc&
