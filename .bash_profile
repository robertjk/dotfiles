################################################################################
#
# ~/.bash_profile
#
################################################################################


# Source ~/.bashrc
[[ -f ~/.bashrc ]] && . ~/.bashrc


# Start X
if systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx
fi
