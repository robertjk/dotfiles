#
# ~/.bash_profile
#


# Source ~/.bashrc
[[ -f ~/.bashrc ]] && . ~/.bashrc


# Run ssh-agent and add a default key to it
# if ! pgrep -u $USER ssh-agent > /dev/null; then
#         ssh-agent > ~/.ssh-agent-thing
# fi
# if [[ "$SSH_AGENT_PID" == "" ]]; then
#         eval $(<~/.ssh-agent-thing)
# fi
# ssh-add -l >/dev/null || alias ssh='ssh-add -l >/dev/null || ssh-add && unalias ssh; ssh'

# Start X
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && startx
