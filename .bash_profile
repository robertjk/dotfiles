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

# Start Keychain to cache SSH keys.
if command-exists "keychain"; then
    eval $(keychain --eval --agents ssh --quiet --noask id_ed25519)
fi

# Start udiskie daemon to automount USB media.
if command-exists "udiskie"; then
    udiskie --automount --tray --notify &
fi
