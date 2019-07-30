if has("autocmd")
    " After opening the file jump to the last position
    augroup jumponlastposition
      autocmd!
      autocmd BufReadPost *
          \ if line("'\"") > 1 && line("'\"") <= line("$") |
          \   exe "normal! g`\"" |
          \ endif
    augroup END
endif
