""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Add function to remove trailing whitespace
"
" Author: Drew Neil
" URL: http://vimcasts.org/episodes/tidying-whitespace/
" Modified by: Robert J. Kusznier
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


function! <SID>TrimTrailingWhitespace()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    let l:chars = col("$")
    " Do the business:
    %s/\s\+$//e
    " Print message
    if (l != line(".")) || (c != col(".")) || (l:chars != col("$"))
        echo "Trailing whitespace stripped\n"
    endif
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

" Remove trailing whitespace automatically for all files
autocmd BufWritePre * :call <SID>TrimTrailingWhitespace()
