""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Plugins
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" ------------------------------------------------------------------------------
" Plug (plugin manager) configuration, listing all the plugins.
" ------------------------------------------------------------------------------

" Specify directory for plugins.
call plug#begin(stdpath('data') . '/plugged')
    " Language/filetype support
    "
    " The ones that I've been using before Polyglot:
    " - tpope/vim-git
    " - pangloss/vim-javascript
    " - othree/html5.vim
    " - cakebaker/scss-syntax.vim
    " - leafgarland/typescript-vim
    " - mxw/vim-jsx
    " - posva/vim-vue
    let g:polyglot_disabled = ['sensible']         " List of plugins in the pack to not use
    Plug 'sheerun/vim-polyglot'                    " Polyglot language pack
    Plug 'hail2u/vim-css3-syntax'                  " CSS 3
    Plug 'Quramy/tsuquyomi'                        " TypeScript IDE support

    " Color schemes
    Plug 'nanotech/jellybeans.vim'          " Jellybeans

    " Others
    Plug 'tpope/vim-abolish'                 " Abolish
    Plug 'vim-airline/vim-airline'           " Airline status line
    Plug 'vim-airline/vim-airline-themes'    " Airline themes
    Plug 'dense-analysis/ale'                " Asynchronous Lint Engine (ALE)
    Plug 'tpope/vim-commentary'              " Commentary
    Plug 'suy/vim-context-commentstring'     " Context commentstring
    Plug 'justinmk/vim-dirvish'              " Dirvish (file explorer)
    Plug 'mattn/emmet-vim'                   " Emmet
    Plug 'editorconfig/editorconfig-vim'     " EditorConfig
    Plug 'tpope/vim-eunuch'                  " Eunuch (shell commands)
    Plug 'tpope/vim-fugitive'                " Fugitive (Git)
                                             " fzf (Installed by OS)
    Plug 'sjl/gundo.vim'                     " Gundo (visual undo tree)
    Plug 'andymass/vim-matchup'              " Matchup (Matchit replacement)
    Plug 'tpope/vim-repeat'                  " Repeat
    Plug 'xolox/vim-session'                 " Session
    Plug 'xolox/vim-misc'                    " (Dependency for vim-session)
    Plug 'tpope/vim-speeddating'             " Speeddating (improving C-A, C-X)
    Plug 'lambdalisue/suda.vim'              " Suda
    Plug 'tpope/vim-surround'                " Surround
    Plug 'godlygeek/tabular'                 " Tabular
    Plug 'kana/vim-textobj-entire'           " Textobj entire (buffer)
    Plug 'kana/vim-textobj-user'             " Textobj user (textobj creation
    " Plug 'SirVer/ultisnips'                " UltiSnips
    " Plug 'honza/vim-snippets'              " Snippets for UltiSnips
    Plug 'tpope/vim-unimpaired'              " Unimpaired (some hotkeys)
    Plug 'nelstrom/vim-visual-star-search'   " Visual star search
                                             " YouCompleteMe
    Plug 'Valloric/YouCompleteMe', { 'do': './install.py --ts-completer' }
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
\    'css': ['prettier'],
\    'scss': ['prettier'],
\    'vue': ['prettier'],
\    'jsx': ['prettier'],
\    'yaml': ['prettier'],
\    'json': ['prettier'],
\    'markdown': ['prettier']
\}
" Lint only when saving file
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_insert_leave = 0
" Apply auto fixes when saving file
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
" fzf
"
" NOTE: fzf is installed as OS package, which automatically adds Vim plugin
" adding :FZF command.
" ------------------------------------------------------------------------------
nnoremap <C-p> :<C-u>FZF<CR>


" ------------------------------------------------------------------------------
" Matchup
" ------------------------------------------------------------------------------

let g:matchup_surround_enabled = 1
let g:matchup_transmute_enabled = 1


" ------------------------------------------------------------------------------
" vim-session
" ------------------------------------------------------------------------------

" Where to save sessions.
let g:session_directory = stdpath('data') . '/session'
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
