""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Briefly blink a search match when moving to it.
" Helps to see the match that cursor jumped to, when match highlighting is on.
"
" Author: Damian Conway's Die Blinkënmatchen.
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


let g:search_blink_time = 0.10

nnoremap <silent> n n:call HLNext(g:search_blink_time)<cr>
nnoremap <silent> N N:call HLNext(g:search_blink_time)<cr>

function! HLNext (blinktime)
  let target_pat = '\c\%#'.@/
  let ring = matchadd('ErrorMsg', target_pat, 101)
  redraw
  exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
  call matchdelete(ring)
  redraw
endfunction ignorecase smartcase
