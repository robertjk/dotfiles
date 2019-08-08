"
" Basic vim settings.
"

" Remove this system directory with C files from the path
set path-=/usr/include

" Run as GUI
if has('gui_running')
    " Remove top menu bar
    set guioptions-=m
    " Remove top toolbar
    set guioptions-=T
    " Remove left scrollbar
    set guioptions-=L
    " Remove right scrollbar
    set guioptions-=r
    " Use console dialogs for simple choices
    set guioptions+=c

    " Font and it's size
    "
    " Some good fonts:
    " - Adobe Source Sans Pro
    " - DejaVu Sans Mono
    " - Fantasque Sans Mono
    " - Fira Code
    " - Fira Mono
    " - Hack
    " - Inconsolata
    " - Iosevka
    " - Menlo
    " - Monaco
    " - Terminus
    set guifont=Inconsolata\ 12
endif

" Use TrueColor in terminal
set termguicolors

" Plus register is the default register
set clipboard^=unnamedplus

" Set default background.
set background=dark

" Display line numbers
set number
" Highlight current line number
set cursorline
" Display vertical line/edge at 80 character
set colorcolumn=80

" Search ignoring case unless there is an uppercase character (smartsearch)
set ignorecase smartcase

" Ignore case when looking for words for autocompletion, but follow the case
" of already typed word
set infercase

" Highlight matching brackets
set showmatch
set matchtime=7   " Highlight matching paren (in insert) for that amout of 100ms.

" Indentation
"
" Use spaces for all indentation and set the size of that indentation
"
" Only default settings, which are overwritten per§ filetype in after/ftplugin
"
" Pressing Tab button inserts spaces (instead of Tab character)
set expandtab      
" Amount of whitespace to insert on indentation command (e.g. >>)
set shiftwidth=4
" Number of spaces to display as Tab character
set tabstop=4
" Tab size automatically inserted when editing. Negative value will use
" shiftwidth
set softtabstop=4

" When breaking lines, do not break in the middle of words
set linebreak

" Look for tags file in .git/ directory
set tags+=.git/tags

" How pressing Tab works in autocomplete mode
set wildmode=list:longest,full

" Sets characters to display in place of Tab and EOL
set listchars=tab:▸\ ,eol:¬

" Set local leader key.
let maplocalleader='_'

" Information stored between Vim invocations in sessions
set shada='1000,f1,<1000,:1000,@1000,/1000,h,! " In Viminfo

" Set persistent undo
set undofile
