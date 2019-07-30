""" Basic vim settings.

" Not Vi compatible
set nocompatible

" Remove this system directory with C files from the path
set path-=/usr/include

" Font and it's size
set guifont=Inconsolata\ 12

" GUI settings
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

" Plus register is the default register
set clipboard^=unnamedplus

" Set default background.
set background=dark

" Display line numbers
set number
" Highlight current line number
set cursorline
" Display current row and column
set ruler
" Display vertical line/edge at 80 character
set colorcolumn=80

" When the file changes outside Vim, auto-reload changes if it wasn't changed
" also in Vim.
set autoread

" Search incrementally, highlight search results
set hlsearch incsearch
" Search ignoring case unless there is an uppercase character (smartsearch)
set ignorecase smartcase

" Display incomplete commands
set showcmd

" Ignore case when looking for words for autocompletion, but follow the case
" of already typed word
set infercase

" Highlight matching brackets
set showmatch
set matchtime=5   " Highlight matching paren (in insert) for that amout of 100ms.

" Indentation
"
" Using spaces for all indentation and set it's size.
"
" If Tab press will insert Tab character (noexpandtab) or spaces (expandtab).
set expandtab      
" Amount of whitespace to insert on indentation command.
set shiftwidth=4
" Number of spaces the Tab will be display as.
set tabstop=4
" Tab size when editing. Negative value will use shiftwidth.
set softtabstop=4

" With of the text area
set textwidth=0
" When breaking lines, do not break in the middle of words
set linebreak

" Remove _ from word characters - it will be treated as separator instead
" set iskeyword-=_

" Look for tags file in .git/ directory
set tags+=.git/tags

" How pressing Tab works in autocomplete mode
set wildmenu
set wildmode=list:longest,full

" Length of Ex commands history list
set history=5000

" Sets characters to display in place of Tab and EOL
set listchars=tab:▸\ ,eol:¬

" Set local leader key.
let maplocalleader = '_'

" Enable syntax highlighting
syntax enable

" Enable file type detection Use the default filetypesettings, so that mail
" gets 'tw' set to 72, 'cindent' is on C files etc. Also load indent files,
" to automatically do language-dependent indenting.
if has("autocmd")
    filetype plugin indent on
endif

" Information stored between Vim invocations
set sessionoptions+=resize,winpos                " In session
set sessionoptions-=buffers
set viminfo='1000,f1,<1000,:1000,@1000,/1000,h,! " In Viminfo
" Change default viminfo location
set viminfo+=n~/.vim/viminfo

" Set persistent undo
if has('persistent_undo')
    set undofile
    " Number of changes to keep track of
    set undolevels=1000
    " Maximum number of lines that will be saved on reload
    set undoreload=10000
endif
