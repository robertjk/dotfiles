################################################################################
#
# ~/.bash_profile
#
################################################################################


# Utility to check if a shell command exists on this system
alias command-exists='command -v >/dev/null 2>&1'


# Run keychain, which runs and manages ssh-agent
if command-exists "keychain"; then
    eval $(keychain --eval --quiet)
fi


# Source ~/.bashrc
[[ -f ~/.bashrc ]] && . ~/.bashrc
