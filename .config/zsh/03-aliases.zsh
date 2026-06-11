# File exploring
alias ll="ls -la --color=auto"
alias ls="ls -l --color=auto"

# Dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias lazyconfig='lazygit --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# Env helpers
alias setenvs='set -a; source .env; set +a'
alias unsetenvs='unset $(grep -v "^#" .env | cut -d= -f1)'

# Python venv
alias setvenv='source ./.venv/bin/activate'
