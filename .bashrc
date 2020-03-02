################################################################################
#
# ~/.bashrc
#
# Dependencies:
# - Git
# - pacman (optional)
# - Yay (optional)
# - udiskie (optional)
#
################################################################################


# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Source parts of bashrc
source "./.bash.d/shell_functionality"
source "./.bash.d/shell_looks"
source "./.bash.d/aliases"
