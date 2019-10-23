""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" After opening the file jump to the last position
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


if has("autocmd")
    augroup jumponlastposition
      autocmd!
      autocmd BufReadPost *
          \ if line("'\"") > 1 && line("'\"") <= line("$") |
          \   exe "normal! g`\"" |
          \ endif
    augroup END
endif
