#
# ~/.bash_profile
#


# Source ~/.bashrc
[[ -f ~/.bashrc ]] && . ~/.bashrc


# Start X
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && startx
