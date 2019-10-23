""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Add linewise mode to `it` text object to help with HTML tags on separate
" lines.
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" 0: Strict, consider non-blank characters before and after the tags.
" 1: Flexible, ignore non-blank characters before and after the tags.
let g:innerMultilineHTMLTagMode = 0

function! InnerMultilineHTMLTag()
   " Get the position of the first line of the last selected Visual area.
   let openingMark =  getpos("'<")

   " Get the position of the last line of the last selected Visual area.
   let closingMark = getpos("'>")

   " Check whether both marks are on the same line.
   if openingMark[1] != closingMark[1]

      " Get the lines where the marks are on.
      let openingLine = getline(openingMark[1])
      let closingLine = getline(closingMark[1])

      " Check whether there's nothing appended to the opening tag.
      if g:innerMultilineHTMLTagMode == 1  ||
         \ match( openingLine, '\S',  openingMark[2] - 1) == -1

         " Check whether the closing tag is at the beginning of the line.
         if match( closingLine, "$" ) + 1  ==  closingMark[2]
            " Restore and adjust the last Visual area.
            normal! gvVojo
            return

         " Check whether there's nothing prepended to the closing tag.
         elseif g:innerMultilineHTMLTagMode == 1  ||
            \   match( closingLine, '\S\%<' . closingMark[2] . "c" ) == -1
            " Restore and adjust the last Visual area.
            normal! gvVkojo
            return
         endif
      endif
   endif

   " Do nothing. Restore the last Visual area.
   normal! gv
endfunction

function! ToggleInnerMultilineHTMLTagMode()
   if g:innerMultilineHTMLTagMode == 0
      let g:innerMultilineHTMLTagMode = 1
      echo "it text object is now flexible"
   else
      let g:innerMultilineHTMLTagMode = 0
      echo "it text object is now strict"
   endif
endfunction

" Map key to set the multi-line HTML tag mode.
nnoremap <leader>h :call ToggleInnerMultilineHTMLTagMode()<CR>

" Map to extend the behavior of the 'it' text object to create linewise
" visual areas within multi-line HTML tags.
" See https://vi.stackexchange.com/q/13050/6698
vnoremap it it:<C-U>call InnerMultilineHTMLTag()<CR>
omap it :normal vit<CR>
