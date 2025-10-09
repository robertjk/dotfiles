if (( ${+commands[fnm]} )); then
    # Setup env variables
    eval "$(fnm env)"
fi