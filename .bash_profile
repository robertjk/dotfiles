#
# ~/.bash_profile
#


# Source ~/.bashrc
[[ -f ~/.bashrc ]] && . ~/.bashrc


# Set locale for OSX
if [[ "$OSTYPE" == "darwin"* ]]; then
    export LANG=en_US.UTF-8
    export LC_TIME=pl_PL.UTF-8
    export LC_MEASUREMENT=pl_PL.UTF-8
fi


# Add Bash completion
if [[ "$OSTYPE" == "darwin"* ]]; then
    if [[ -e "/usr/local/share/bash-completion/bash_completion" ]]; then
        export BASH_COMPLETION_COMPAT_DIR="/usr/local/etc/bash_completion.d"
        source "/usr/local/share/bash-completion/bash_completion"
    elif [[ -e "/usr/local/etc/profile.d/bash_completion.sh" ]]; then
        source "/usr/local/etc/profile.d/bash_completion.sh"
    elif [[ -e "/etc/bash_completion" ]]; then
        source "/etc/bash_completion"
    fi
fi


# Set React Native debugger to React Native Debugger
export REACT_DEBUGGER="open -g 'rndebugger://set-debugger-loc?port=8001'"
