""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Plugins
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" ------------------------------------------------------------------------------
" Plug (plugin manager) configuration, listing all the plugins.
" ------------------------------------------------------------------------------

" Specify directory for plugins.
call plug#begin($MYVIMCACHE . 'plugged')
    " Language/filetype support
    "
    " The ones that I've been using before Polyglot:
    " - tpope/vim-git
    " - PotatoesMaster/i3-vim-syntax
    " - pangloss/vim-javascript
    " - othree/html5.vim
    " - cakebaker/scss-syntax.vim
    " - leafgarland/typescript-vim
    " - mxw/vim-jsx
    " - posva/vim-vue
    Plug 'sheerun/vim-polyglot'                    " Polyglot language pack
    Plug 'hail2u/vim-css3-syntax'                  " CSS 3
                                                   " Styled components
    Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
    Plug 'Quramy/tsuquyomi'                        " TypeScript IDE support
    Plug 'Shougo/vimproc.vim', {'do' : 'make'}     " Dependency for tsuquyomi

    " Color schemes
    Plug 'sjl/badwolf'                                    " Bad Wolf
    Plug 'blockloop/vim-codeschool'                       " Codeschool
    Plug 'nanotech/jellybeans.vim'                        " Jellybeans
    Plug 'erichdongubler/vim-sublime-monokai'             " Monokai
    Plug 'arcticicestudio/nord-vim'                       " Nord
    Plug 'mhartington/oceanic-next'                       " Oceanic Next
    Plug 'NLKNguyen/papercolor-theme'                     " PaperColor
    Plug 'altercation/vim-colors-solarized'               " Solarized
    Plug 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}   " Tomorrow

    " Others
    Plug 'tpope/vim-abolish'                 " Abolish
    Plug 'vim-airline/vim-airline'           " Airline status line
    Plug 'vim-airline/vim-airline-themes'    " Airline themes
    Plug 'dense-analysis/ale'                " Asynchronous Lint Engine (ALE)
    Plug 'tpope/vim-commentary'              " Commentary
    Plug 'suy/vim-context-commentstring'     " Context commentstring
    Plug 'ctrlpvim/ctrlp.vim'                " ctrlp (fuzzy finder)
    Plug 'FelikZ/ctrlp-py-matcher'           " ctrlp matcher
    Plug 'justinmk/vim-dirvish'              " Dirvish (file explorer)
    Plug 'mattn/emmet-vim'                   " Emmet
    Plug 'editorconfig/editorconfig-vim'     " EditorConfig
    Plug 'tpope/vim-eunuch'                  " Eunuch (shell commands)
    Plug 'tpope/vim-fugitive'                " Fugitive (Git)
    Plug 'sjl/gundo.vim'                     " Gundo (visual undo tree)
    Plug 'andymass/vim-matchup'              " Matchup (Matchit replacement)
    Plug 'tpope/vim-repeat'                  " Repeat
    Plug 'xolox/vim-session'                 " Session
    Plug 'xolox/vim-misc'                    " (Dependency for vim-session)
    Plug 'tpope/vim-speeddating'             " Speeddating (improving C-A, C-X)
    Plug 'tpope/vim-surround'                " Surround
    Plug 'godlygeek/tabular'                 " Tabular
    Plug 'kana/vim-textobj-entire'           " Textobj entire (buffer)
    Plug 'kana/vim-textobj-user'             " Textobj user (textobj creation
    " Plug 'SirVer/ultisnips'                " UltiSnips
    " Plug 'honza/vim-snippets'              " Snippets for UltiSnips
    Plug 'tpope/vim-unimpaired'              " Unimpaired (some hotkeys)
    Plug 'nelstrom/vim-visual-star-search'   " Visual star search
                                             " YouCompleteMe
    Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
call plug#end()


" ------------------------------------------------------------------------------
" Airline
" ------------------------------------------------------------------------------

" Color theme
let g:airline_theme = 'jellybeans'
" Disable displaying Git branch name
let g:airline#extensions#branch#enabled = 0

" ------------------------------------------------------------------------------
" Ale
" ------------------------------------------------------------------------------

" Configure linters and auto-fixers for particular filetypes
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'typescript': ['tsserver', 'eslint'],
\   'vue': ['eslint']
\}
let g:ale_fixers = {
\    'javascript': ['prettier'],
\    'typescript': ['prettier'],
\    'vue': ['prettier'],
\    'scss': ['prettier'],
\    'html': ['prettier']
\}
" Lint only when saving file
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_insert_leave = 0
" Apply auto fixing on save
let g:ale_fix_on_save = 1
" Do not highlight area with error (only set sign marker)
let g:ale_set_highlights = 0


" ------------------------------------------------------------------------------
" Color theme (here, because themes are imported as plugins)
" ------------------------------------------------------------------------------

colorscheme jellybeans
" Jellybeans settings
let g:jellybeans_use_term_italics = 1
" Overwrite default colors of wild menu
let g:jellybeans_overrides = {
    \ 'StatusLine': {'guifg': '000000', 'guibg': 'aaaaaa', 'attr': ''},
    \ 'WildMenu':   {'guifg': 'f0a0c0', 'guibg': '302028', 'attr': 'italic'},
\}


" ------------------------------------------------------------------------------
" ctrlp
" ------------------------------------------------------------------------------

" Which command to start when pressing Ctrl + P
let g:ctrlp_cmd = 'CtrlPLastMode'
" Set maximum number of results
let g:ctrlp_match_window = 'results:1000'
" How to handle situation when opening a file already opened in another window
let g:ctrlp_switch_buffer = 'et'
" ctrlp will work in current directory by default
let g:ctrlp_working_path_mode = 'd'
" Include hidden files and directories
let g:ctrlp_show_hidden = 1
" Set maximum number of files to scan to unlimited
let g:ctrlp_max_files = 0
" Persist cache between sessions
let g:ctrlp_clear_cache_on_exit = 0
" Extensions to use
let g:ctrlp_extensions = []
" PyMatcher function for CtrlP
if !has('python')
    echo 'In order to use pymatcher plugin, you need +python compiled vim'
else
    let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
endif
" Directories to ignore
set wildignore+=*/node_modules/*,*/.git/*
" Custom mappings
nnoremap <Leader><C-p>d :CtrlP ~/Documents<CR>
nnoremap <Leader><C-p>v :CtrlP ~/.config/nvim<CR>


" ------------------------------------------------------------------------------
" Dirvish
" ------------------------------------------------------------------------------

" Display directories first, then files
let g:dirvish_mode = ':sort ,^.*[\/],'
" Overwrite netrw by dirvish
let g:loaded_netrwPlugin = 1
command! -nargs=? -complete=dir Explore Dirvish <args>
command! -nargs=? -complete=dir Sexplore belowright split | silent Dirvish <args>
command! -nargs=? -complete=dir Vexplore leftabove vsplit | silent Dirvish <args>


" ------------------------------------------------------------------------------
" Matchup
" ------------------------------------------------------------------------------

let g:matchup_surround_enabled = 1
let g:matchup_transmute_enabled = 1


" ------------------------------------------------------------------------------
" Polyglot
" ------------------------------------------------------------------------------

" List of plugins in the pack to not use
let g:polyglot_disabled = []


" ------------------------------------------------------------------------------
" vim-session
" ------------------------------------------------------------------------------

" Where to save sessions.
let g:session_directory = $MYVIMCACHE . 'session'
" not display prompt for loading last/default session when Vim starts
let g:session_autoload = 'no'
" Save session on quitting Vim
let g:session_autosave = 'yes'
" Autosave session this often (minutes).
let g:session_autosave_periodic = 1
" Autosave does not print message.
let g:session_autosave_silent = 1
" Generate less verbose messages.
let g:session_verbose_messages = 0
" Open last session instead of default one.
let g:session_default_to_last = 1
" Commands changed to start with Session.
let g:session_command_aliases = 1
" Save this global variables.
let g:session_persist_globals = ['&path', '&wildignore']


" ------------------------------------------------------------------------------
" tsuquyomi
" ------------------------------------------------------------------------------

autocmd FileType typescript nmap <buffer> <Leader>t : <C-u>echo tsuquyomi#hint()<CR>


" ------------------------------------------------------------------------------
" UltiSnips
" ------------------------------------------------------------------------------
" let g:UltiSnipsSnippetsDir = '~/.vim/UltiSnips'


" ------------------------------------------------------------------------------
" YouCompleteMe
" ------------------------------------------------------------------------------

" Define what tokens trigger autocompletion
if !exists("g:ycm_semantic_triggers")
  let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers['typescript'] = ['.']
