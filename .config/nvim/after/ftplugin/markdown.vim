setlocal tabstop=2

if has("autocmd")
    augroup markdown_mappings
        onoremap ih :<c-u>execute "normal! ?\\v^[=-]{2,}$\r:nohlsearch\rkvg_"<cr>
        onoremap ah :<c-u>execute "normal! ?\\v^[=-]{2,}$\r:nohlsearch\rg_vk0"<cr>
    augroup END
endif
