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
fi

# Prompt color variables
T_BLACK="\[$(tput setaf 0)\]"
T_RED="\[$(tput setaf 1)\]"
T_GREEN="\[$(tput setaf 2)\]"
T_YELLOW="\[$(tput setaf 3)\]"
T_BLUE="\[$(tput setaf 4)\]"
T_MAGENTA="\[$(tput setaf 5)\]"
T_CYAN="\[$(tput setaf 6)\]"
T_WHITE="\[$(tput setaf 7)\]"
T_BLACK_BRIGHT="\[$(tput setaf 8)\]"
T_RED_BRIGHT="\[$(tput setaf 9)\]"
T_GREEN_BRIGHT="\[$(tput setaf 10)\]"
T_YELLOW_BRIGHT="\[$(tput setaf 11)\]"
T_BLUE_BRIGHT="\[$(tput setaf 12)\]"
T_MAGENTA_BRIGHT="\[$(tput setaf 13)\]"
T_CYAN_BRIGHT="\[$(tput setaf 14)\]"
T_WHITE_BRIGHT="\[$(tput setaf 15)\]"
T_BLACK_DARK="\[$(tput setaf 16)\]"
T_BLUE_DARK5="\[$(tput setaf 17)\]"
T_BLUE_DARK4="\[$(tput setaf 18)\]"
T_BLUE_DARK3="\[$(tput setaf 19)\]"
T_BLUE_DARK2="\[$(tput setaf 20)\]"
T_BLUE_DARK1="\[$(tput setaf 21)\]"
T_RESET="\[$(tput sgr0)\]"

# Prompt format:
#
# user as hostname path_relative_to_working_directory on git_branch
# $
git_prompt() {
    local branch=`git branch --show-current 2> /dev/null`
    if [ -n "$branch" ]
    then
        # Green and reset. Not using variables because there are issues with
        # escaping \[ and \]
        branch=" on $(tput setaf 2)${branch}$(tput sgr0)"
    fi
    echo "$branch"
}
PS1="${T_YELLOW}\u${T_RESET} at ${T_YELLOW_BRIGHT}\h${T_RESET} in ${T_BLUE}\w${T_RESET}\$(git_prompt)\n${T_WHITE}\$${T_RESET} "

# Add new line before every prompt
PROMPT_COMMAND="printf '\n';$PROMPT_COMMAND"

# Adding colors to man pages
export LESS_TERMCAP_mb=$'\e[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\e[01;38;5;74m'  # begin bold
export LESS_TERMCAP_me=$'\e[0m'           # end mode
export LESS_TERMCAP_se=$'\e[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\e[38;5;246m'    # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\e[0m'           # end underline
export LESS_TERMCAP_us=$'\e[04;38;5;146m' # begin underline man less pager



### Shell functionality

# Set Vim as default editor.
export EDITOR=nvim

# History settings
HISTFILESIZE=100000000
HISTSIZE=10000

# Allow to use CTRL-s to search history forward like CTRL-r does backward
stty -ixon



### Aliases

# Unix commands

# OS dependent

if [[ "$OSTYPE" == "linux-gnu" ]]; then
    # Linux
    alias ls='ls --color=auto' # Add coloring to ls
    alias diff='diff --color=auto' # Add coloring to diff
elif [[ "$OSTYPE" == "darwin"* ]]; then
    # OS X
    alias ls='ls -G' # Add coloring to ls
fi

# OS independent

alias grep='grep --color=auto' # Add coloring to grep
alias egrep='egrep --color=auto' # Add coloring to grep
alias fgrep='fgrep --color=auto' # Add coloring to grep

alias ll='ls -lFh'
alias la='ls -lAFh'
alias l1='ls -1F'

alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

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
if [ -f "/etc/arch-release" ]; then
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
fi

# USB media
if type "udiskie-umount" > /dev/null 2>&1; then
    alias media-unmount="udiskie-umount --detach"
fi
