# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set zsh theme
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

COMPLETION_WAITING_DOTS="true"

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

alias config='git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias lazy-config='lazygit --git-dir=$HOME/.cfg/ --work-tree=$HOME'

alias ls='ls -l --color=auto'
alias ll='ls -la --color=auto'
alias grep='grep --color=auto'
alias cat='ccat'

alias dps='docker ps --format "table {{.Image}}\t{{.CreatedAt}}\t{{.Status}}\t{{.Names}}"'
alias drmall='docker stop $(docker ps -q) ; docker rm $(docker ps -qa)'

alias dclup='docker compose -f local.yml up -d'
alias dclupb='docker compose -f local.yml up -d --build'
alias dcldown='docker compose -f local.yml down'

alias dlogs='docker logs'

