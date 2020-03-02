""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Various helpful mappings and abbreviations.
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" ------------------------------------------------------------------------------
" Mappings for (un)learning.
"
" HINT: To disable a key (e.g. to temporarily force yourself to not use it for
" changing habits) map it to <Nop> (no operation).
" ------------------------------------------------------------------------------

" To be removed when (un)learnt.
map! <BS> <Nop>


" ------------------------------------------------------------------------------
" Regular mappings
" ------------------------------------------------------------------------------

" Map editing commonly accessed files to <Leader><file-key>
" Vim
nnoremap <Leader>evv  :edit    $MYVIMRC<CR>
nnoremap <Leader>spvv :vsplit  $MYVIMRC<CR>
nnoremap <Leader>tvv  :tabedit $MYVIMRC<CR>
nnoremap <Leader>evb  :edit    $MYVIMCONFIG/init-parts/basic.vim<CR>
nnoremap <Leader>spvb :vsplit  $MYVIMCONFIG/init-parts/basic.vim<CR>
nnoremap <Leader>tvb  :tabedit $MYVIMCONFIG/init-parts/basic.vim<CR>
nnoremap <Leader>evm  :edit    $MYVIMCONFIG/init-parts/mappings.vim<CR>
nnoremap <Leader>spvm :vsplit  $MYVIMCONFIG/init-parts/mappings.vim<CR>
nnoremap <Leader>tvm  :tabedit $MYVIMCONFIG/init-parts/mappings.vim<CR>
nnoremap <Leader>evp  :edit    $MYVIMCONFIG/init-parts/plugin.vim<CR>
nnoremap <Leader>spvp :vsplit  $MYVIMCONFIG/init-parts/plugin.vim<CR>
nnoremap <Leader>tvp  :tabedit $MYVIMCONFIG/init-parts/plugin.vim<CR>
nnoremap <Leader>evl  :edit    $MYVIMCONFIG/to-learn.md<CR>
nnoremap <Leader>spvl :vsplit  $MYVIMCONFIG/to-learn.md<CR>
nnoremap <Leader>tvl  :tabedit $MYVIMCONFIG/to-learn.md<CR>
" bashrc
nnoremap <Leader>ebr  :edit    ~/.bashrc<CR>
nnoremap <Leader>spbr :vsplit  ~/.bashrc<CR>
nnoremap <Leader>tbr  :tabedit ~/.bashrc<CR>
nnoremap <Leader>ebp  :edit    ~/.bash_profile<CR>
nnoremap <Leader>spbp :vsplit  ~/.bash_profile<CR>
nnoremap <Leader>tbp  :tabedit ~/.bash_profile<CR>
" i3 config
nnoremap <Leader>ei3  :edit    ~/.config/i3/config<CR>
nnoremap <Leader>spi3 :vsplit  ~/.config/i3/config<CR>
nnoremap <Leader>ti3  :tabedit ~/.config/i3/config<CR>

" Map sourcing vimrc to <Leader>sv
nnoremap <Leader>sov :source $MYVIMRC<CR>

" Map <C-p> and <C-n> in command mode to <Up> and <Down>
" to ease navigating command history
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

" Windows
nnoremap <C-W>vn :vnew<CR>
nnoremap <C-W><C-V>n :vnew<CR>
nnoremap <C-W><C-V><C-N> :vnew<CR>

" Tabs
nnoremap <C-T>h :tabprev<CR>
nnoremap <C-T>l :tabnext<CR>
nnoremap <C-T>H :tabmove -1<CR>
nnoremap <C-T>L :tabmove +1<CR>
nnoremap <C-T>n :tabnew<CR>
nnoremap <C-T>c :tabclose<CR>
nnoremap <C-T>q :tabclose<CR>
nnoremap <C-T>o :tabonly<CR>
nnoremap <C-T>0 :tablast<CR>
nnoremap <C-T>1 :tabfirst<CR>
nnoremap <C-T>2 :2 tabnext<CR>
nnoremap <C-T>3 :3 tabnext<CR>
nnoremap <C-T>4 :4 tabnext<CR>
nnoremap <C-T>5 :5 tabnext<CR>
nnoremap <C-T>6 :6 tabnext<CR>
nnoremap <C-T>7 :7 tabnext<CR>
nnoremap <C-T>8 :8 tabnext<CR>
nnoremap <C-T>9 :9 tabnext<CR>

" Displaying whitespace characters.
" Maps toggling between showing whitespace to <Leader>.
nmap <Leader>l :set list!<CR>

" %% in command line inserts path of current file
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" Edit in current directory
map <Leader>ew :edit %%
map <Leader>es :split %%
map <Leader>ev :vsplit %%
map <Leader>et :tabedit %%

" Map :nohlsearch (disable search highlight) to <Ctrl-l>
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

" Map & (repeat the last search discarding the flags) to && (repeat the last
" search including the flags)
nnoremap & :&&<CR>
xnoremap & :&&<CR>

" Help in vertical split
cnoreabbrev vhelp vertical help
cnoreabbrev vh vertical help
