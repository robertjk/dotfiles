################################################################################
#
# ~/.bash_profile
#
# Dependencies:
# - Keychain (optional)
# - udiskie (optional)
#
################################################################################


# Source ~/.bashrc
[[ -f ~/.bashrc ]] && . ~/.bashrc

# Initialize SSH agent environment
export SSH_AUTH_SOCK="${XDG_RUNTIME_DIR}/ssh-agent.socket"

# # Temporary fix for ly breaking locale settings
source /etc/locale.conf
export LC_MESSAGES

# Needed by pipewire-media-session
# export XDG_CURRENT_DESKTOP=sway

# Start sway if running first virtual terminal
#if [ "$(tty)" = "/dev/tty1" ]; then
#	exec sway
#fi
