" Set Neovim files locations in variables
let $MYVIMCONFIG = '~/.config/nvim/'
let $MYVIMCACHE = '~/.local/share/nvim/'

" First set basic settings.
source ~/.config/nvim/init-parts/basic.vim

" Add some features to Vim
source ~/.config/nvim/init-parts/plugin.vim
source ~/.config/nvim/init-parts/html-text-object-linewise.vim
source ~/.config/nvim/init-parts/open-file-on-last-position.vim
source ~/.config/nvim/init-parts/search-match-blink.vim

" Set mappings and abbreviations
source ~/.config/nvim/init-parts/abbreviation.vim
source ~/.config/nvim/init-parts/mapping.vim
