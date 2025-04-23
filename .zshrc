# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set zsh theme
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

COMPLETION_WAITING_DOTS="true"

# Plugins that we use, see a complete list in
# https://github.com/ohmyzsh/ohmyzsh/wiki/Plugins
plugins=(
  git
	aliases
	colored-man-pages
	colorize
	compleat
	docker
  themes
)

source $ZSH/oh-my-zsh.sh

# --- Aliases ---
alias config='git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias lazy-config='lazygit --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# Basic commands
alias ls='ls -l --color=auto'
alias ll='ls -la --color=auto'
alias grep='grep --color=auto'
alias cat='ccat'

# Docker related commands
alias dps='docker ps --format "table {{.Image}}\t{{.CreatedAt}}\t{{.Status}}\t{{.Names}}"'
alias drmall='docker stop $(docker ps -q) ; docker rm $(docker ps -qa)'

alias dcupd='docker compose up -d'
alias dcupdb='docker compose up -d --build'
alias dcdown='docker compose down'

alias dlogs='docker logs'

# Platformio
alias piou='pio run -t upload'
alias piom='pio run -t monitor'
alias pioum='pio run -t upload && pio run -t monitor'

# FinTree
alias dlfa='docker logs fintree-api -f'
alias dlfs='docker logs fintree-scraper -f'
alias dlff='docker logs fintree-front -f'

alias defa='docker exec -it fintree-api bash'
alias defs='docker exec -it fintree-scraper bash'
alias deff='docker exec -it fintree-front bash'

# SSH to my portfolio's machine
alias sshd='ssh root@170.64.175.43'

# Activate the current's dir python virtual environment
alias venv='source venv/bin/activate'

# Frases project
alias hola='curl localhost:8005'

# bun completions
[ -s "/home/alex/.bun/_bun" ] && source "/home/alex/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

