"
" Various helpful mappings.
"

" HINT: To disable a key (e.g. to temporarily force yourself to not use it for
" changing habits) map it to <Nop> (no operation).

" Mappings for (un)learning.
" To be removed when (un)learnt.
" map! <BS> <Nop>

" Map editing commonly accessed files to <Leader><file-key>
" Vim
nnoremap <Leader>evv  :edit   $MYVIMRC<CR>
nnoremap <Leader>spvv :vsplit $MYVIMRC<CR>
nnoremap <Leader>evb  :edit   $MYVIMCONFIG/init-parts/basic.vim<CR>
nnoremap <Leader>spvb :vsplit $MYVIMCONFIG/init-parts/basic.vim<CR>
nnoremap <Leader>evm  :edit   $MYVIMCONFIG/init-parts/mapping.vim<CR>
nnoremap <Leader>spvm :vsplit $MYVIMCONFIG/init-parts/mapping.vim<CR>
nnoremap <Leader>evp  :edit   $MYVIMCONFIG/init-parts/plugin.vim<CR>
nnoremap <Leader>spvp :vsplit $MYVIMCONFIG/init-parts/plugin.vim<CR>
nnoremap <Leader>evl  :edit   $MYVIMCONFIG/to-learn.md<CR>
nnoremap <Leader>spvl :vsplit $MYVIMCONFIG/to-learn.md<CR>
" bashrc
nnoremap <Leader>ebr  :edit   ~/.bashrc<CR>
nnoremap <Leader>spbr :vsplit ~/.bashrc<CR>
nnoremap <Leader>ebp  :edit   ~/.bash_profile<CR>
nnoremap <Leader>spbp :vsplit ~/.bash_profile<CR>
" i3 config
nnoremap <Leader>ei3  :edit   ~/.config/i3/config<CR>
nnoremap <Leader>spi3 :vsplit ~/.config/i3/config<CR>

" Map sourcing vimrc to <Leader>sv
nnoremap <Leader>sov :source $MYVIMRC<CR>

" Map <C-p> and <C-n> in command mode to <Up> and <Down>
" to ease navigating command history
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

" Displaying whitespace characters.
" Maps toggling between showing whitespace to <Leader>.
nmap <Leader>l :set list!<CR>

" %% in command line inserts path of current file
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" Map :nohlsearch (disable search highlight) to <Ctrl-l>
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

" Map & (repeat the last search discarding the flags) to && (repeat the last
" search including the flags)
nnoremap & :&&<CR>
xnoremap & :&&<CR>

" Map <F6> to rebuild tag index (recursively from the current directory)
nnoremap <F6> :!ctags -R<CR>
noremap <F6> :!ctags -R<CR>
