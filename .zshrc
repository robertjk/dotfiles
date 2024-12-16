
### Zim

# Config in ~/.config/zsh/.zimrc

ZIM_HOME=~/.cache/zim

# Download zimfw plugin manager if missing.
if [[ ! -e ${ZIM_HOME}/zimfw.zsh ]]; then
  curl -fsSL --create-dirs -o ${ZIM_HOME}/zimfw.zsh \
      https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
fi
# Install missing modules, and update ${ZIM_HOME}/init.zsh if missing or outdated.
if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZDOTDIR:-${HOME}}/.zimrc ]]; then
  source ${ZIM_HOME}/zimfw.zsh init -q
fi

# Initialize ssh module
zstyle ':zim:ssh' ids 'id_ed25519'

# Initialize modules
source ${ZIM_HOME}/init.zsh

### nvm

export NVM_DIR="$HOME/.nvm"

# Load nvm
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"

# Auto load proper Node version when changing directories
load-nvmrc() {
  local nvmrc_path
  nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version
    nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$(nvm version)" ]; then
      nvm use
    fi
  elif [ -n "$(PWD=$OLDPWD nvm_find_nvmrc)" ] && [ "$(nvm version)" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
autoload -U add-zsh-hook
add-zsh-hook chpwd load-nvmrc
load-nvmrc

### Other

# Rename history file to better follow naming conventions
export HISTFILE=~/.zhistory

# Better colors in man pages
# https://en.wikipedia.org/wiki/ANSI_escape_code#Colors
man() {
    env \
        LESS_TERMCAP_mb=$(printf "\e[1;33m") \
        LESS_TERMCAP_md=$(printf "\e[1;33m") \
        LESS_TERMCAP_me=$(printf "\e[0m") \
        LESS_TERMCAP_se=$(printf "\e[0m") \
        LESS_TERMCAP_so=$(printf "\e[1;46;97m") \
        LESS_TERMCAP_ue=$(printf "\e[0m") \
        LESS_TERMCAP_us=$(printf "\e[1;32m") \
            man "$@"
}

# Apollo
# Enable ESLint pre-commit hook in leadgenie repository
export LEADGENIE_ENABLE_ESLINT_PRECOMMIT_HOOK=1
# Aliases
alias leadgenie-up="docker compose up --detach"
alias leadgenie-up-clean="docker compose up --detach --build"
alias leadgenie-down="docker compose down"
alias leadgenie-down-clean="docker compose down --volumes"
alias leadgenie-cypress-up="docker compose --profile be-for-cypress up --detach"
alias leadgenie-cypress-down="docker compose --profile be-for-cypress down"
alias leadgenie-restart="docker compose restart"
alias leadgenie-rails-console="docker compose exec rails bundle exec rails console"
alias leadgenie-rails-shell="docker exec --interactive --tty $(docker ps --filter name=rails --latest --format "{{.ID}}") bash"
alias leadgenie-rails-logs="docker compose logs rails -f  "