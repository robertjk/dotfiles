"
" Plugins
"

" TODO (Plugins to check out):
" * Valloric/YouCompleteMe

" Plug (plugin manager) configuration listing all the plugins.
" Specify directory for plugins.
call plug#begin($MYVIMCACHE . 'plugged')
    " Language/filetype support
    Plug 'hail2u/vim-css3-syntax'            " CSS 3
    Plug 'tpope/vim-git'                     " Git
    Plug 'PotatoesMaster/i3-vim-syntax'      " i3 Window Manager
    Plug 'pangloss/vim-javascript'           " JavaScript
    Plug 'mxw/vim-jsx'                       " JSX
    Plug 'othree/html5.vim'                  " HTML 5
    Plug 'cakebaker/scss-syntax.vim'         " Sass (SCSS)
    Plug 'leafgarland/typescript-vim'        " Typescript
    Plug 'posva/vim-vue'                     " Vue.js

    " Color schemes
    Plug 'sjl/badwolf'                                    " Bad Wolf
    Plug 'blockloop/vim-codeschool'                       " Codeschool
    Plug 'nanotech/jellybeans.vim'                        " Jellybeans
    Plug 'erichdongubler/vim-sublime-monokai'             " Monokai
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
    Plug 'editorconfig/editorconfig-vim'     " EditorConfig
    Plug 'tpope/vim-eunuch'                  " Eunuch (shell commands)
    Plug 'tpope/vim-fugitive'                " Fugitive (Git)
    Plug 'sjl/gundo.vim'                     " Gundo (visual undo tree)
    Plug 'chrisbra/matchit'                  " Matchit
    Plug 'xolox/vim-session'                 " Session
    Plug 'xolox/vim-misc'                    " (Dependency for vim-session)
    Plug 'tpope/vim-surround'                " Surround
    Plug 'godlygeek/tabular'                 " Tabular
    Plug 'kana/vim-textobj-entire'           " Textobj entire (buffer)
    Plug 'kana/vim-textobj-user'             " Textobj user (textobj creation
    " Plug 'SirVer/ultisnips'                " UltiSnips
    " Plug 'honza/vim-snippets'              " Snippets for UltiSnips
    Plug 'tpope/vim-unimpaired'              " Unimpaired (some hotkeys)
    Plug 'nelstrom/vim-visual-star-search'   " Visual star search
call plug#end()

" Airline
let g:airline_theme = 'jellybeans'
" Tabline extension - display all buffers in tab space when only one tab open
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#formatter = 'unique_tail'

" Set color theme (here, because used theme is imported as a plugin)
colorscheme jellybeans
" Jellybeans settings
let g:jellybeans_use_term_italics = 1
let g:jellybeans_overrides = {
    \ 'StatusLine': {'guifg': '000000', 'guibg': 'aaaaaa', 'attr': ''},
    \ 'WildMenu':   {'guifg': 'f0a0c0', 'guibg': '302028', 'attr': 'italic'},
\}

" Context commenstring
" Without this line adding new keys doeesn't work. Don't know why...
let g:context#commentstring#table = g:context#commentstring#table
let g:context#commentstring#table.php = {
    \ 'javaScript'  : '// %s',
    \ 'phpRegion'   : '// %s',
    \ 'cssStyle'    : '/*%s*/',
\}

" ctrlp
" Set maximum number of results to unlimited
let g:ctrlp_match_window = 'results:1000'
" ctrlp will work in current directory by default
let g:ctrlp_working_path_mode = 'd'
" Include hidden files and directories
let g:ctrlp_show_hidden = 1 
" Set maximum number of files to scan to unlimited
let g:ctrlp_max_files = 0
" Persist cache between sessions
let g:ctrlp_clear_cache_on_exit = 0
" Extensions to use
let g:ctrlp_extensions = ['tag']
" PyMatcher function for CtrlP
if !has('python')
    echo 'In order to use pymatcher plugin, you need +python compiled vim'
else
    let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
endif
" Custom mappings
nnoremap <Leader><C-p>d :CtrlP ~/documents<CR>
nnoremap <Leader><C-p>v :CtrlP ~/.vim<CR>

" Dirvish
" Display directories first, then files
let g:dirvish_mode = ':sort ,^.*[\/],'
" Overwrite netrw by dirvish
let g:loaded_netrwPlugin = 1
command! -nargs=? -complete=dir Explore Dirvish <args>
command! -nargs=? -complete=dir Sexplore belowright split | silent Dirvish <args>
command! -nargs=? -complete=dir Vexplore leftabove vsplit | silent Dirvish <args>

" vim-session
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

" UltiSnips
" let g:UltiSnipsSnippetsDir = '~/.vim/UltiSnips'
