################################################################################
#
# ~/.bash_profile
#
################################################################################


# Source ~/.bashrc
[[ -f ~/.bashrc ]] && . ~/.bashrc

# Start udiskie daemon - automounting USB media
udiskie --automount --tray --notify &
