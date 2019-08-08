#
# ~/.bashrc
#


# If not running interactively, don't do anything
[[ $- != *i* ]] && return


### Shell look

# Load dircolors values from ~/.dir_colors if using terminal supporting more
# than 8 colors.
ncolors=$(tput colors)
if test -n "$ncolors" && test $ncolors -gt 8; then
    if [[ -f ~/.dir_colors ]]; then
        eval `dircolors -b ~/.dir_colors`
    fi
    # For sshrc
    if [[ -f $SSHHOME/.sshrc.d/.dir_colors ]]; then
        eval `dircolors -b $SSHHOME/.sshrc.d/.dir_colors`
    fi
fi

# Prompt format and coloring
T_BROWN="\[$(tput setaf 3)\]"
T_BLUE="\[$(tput setaf 4)\]"
T_PINK="\[$(tput setaf 5)\]"
T_WHITE="\[$(tput setaf 7)\]"
T_VIOLET="\[$(tput setaf 13)\]"
T_RESET="\[$(tput sgr0)\]"
# user@hostname:path_relative_to_working_directory
# $
PS1="[${T_BLUE}\u@\h${T_RESET}: ${T_BROWN}\w${T_RESET}]\n${T_WHITE}\$${T_RESET} "

# Adding colors to man pages
export LESS_TERMCAP_mb=$'\e[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\e[01;38;5;74m'  # begin bold
export LESS_TERMCAP_me=$'\e[0m'           # end mode
export LESS_TERMCAP_se=$'\e[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\e[38;5;246m'    # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\e[0m'           # end underline
export LESS_TERMCAP_us=$'\e[04;38;5;146m' # begin underline man less pager


### Shell functionality

# History settings
HISTFILESIZE=100000000
HISTSIZE=10000

# Set Vim as default editor.
export EDITOR=nvim

# Allow to use CTRL-s to search history forward like CTRL-r does backward
stty -ixon


### Aliases

# Unix commands
alias ls='ls --color=auto' # Add coloring to ls
alias ll='ls -lFh'
alias la='ls -lAFh'
alias l1='ls -1F'
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias diff='diff --color=auto' # Add coloring to diff
alias grep='grep --color=auto' # Add coloring to grep
alias egrep='egrep --color=auto' # Add coloring to grep
alias fgrep='fgrep --color=auto' # Add coloring to grep

alias pse='ps -e'
alias psf='ps -f'
alias psef='ps -ef'

alias dfsd='df -h | grep /dev/sd'
alias dus='du -s -h'

alias free='free -h'

# Sudo. Required to be able to call aliased command with sudo.
# http://www.shellperson.net/using-sudo-with-an-alias/
alias sudo='sudo '

# Tar
alias tar-gz-extract='tar -xzvf'
alias tar-gz-create='tar -czvf'

# Pacman
alias pacman='pacman --color auto'
alias yay='yay --color auto'
alias pacman-arch-upgrade='pacman -Syu'
alias yay-arch-upgrade='yay -Syu'
alias pacman-remove-orphans='pacman -Rns $(pacman -Qtdq)'
alias pacman-list-orphans='pacman -Qdt'
# List explicitly installed packages which weren't initially installed by Arch
# (don't belong to 'base' nor 'base-devel' gropus).
alias pacman-list-my-explicit="expac --timefmt='%Y-%m-%d %T' '%l\t%n' `pacman -Qei | awk '/^Name/ { name=\$3 } /^Groups/ { if ( \$3 != \"base\" && \$3 != \"base-devel\" ) { print name } }' | echo \$(cat)` | sort"
alias pacman-list-last-20="expac --timefmt='%Y-%m-%d %T' '%l\t%n' | sort | tail -n 20"

# USB media
alias media-unmount="udiskie-umount --detach"
