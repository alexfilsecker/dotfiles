# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set zsh theme
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
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
alias dlpf='docker logs -f previpago_front'
alias dlpb='docker logs -f previpago-back'
alias dlpws='docker logs -f previpago-ws'
alias dlplp='docker logs -f prev-go'
alias dlpda='docker logs -f documents-api'
alias dlpo='docker logs -f previpago-operations'

alias dlrf='docker logs -f reonline-front'
alias dlrb='docker logs -f reonline-back'
alias dlrws='docker logs -f reonline-ws'
alias dlrlp='docker logs -f reonline-line-processor'
alias dlrda='docker logs -f reonline-doc-api'
alias dlro='docker logs -f reonline-operations'

alias depws='docker exec -it previpago-ws bash'
alias depb='docker exec -it previpago-back bash'

alias derws='docker exec -it reonline-ws bash'
alias derb='docker exec -it reonline-back bash'

alias cdpf='cd ~/previpago/previpago-front'
alias cdpb='cd ~/previpago/previpago-back'
alias cdpws='cd ~/previpago/previpago-ws'
alias cdplp='cd ~/previpago/previpago-line-processor'
alias cdpda='cd ~/previpago/previpago-document-api'
alias cdpo='cd ~/previpago/previpago-operations'

alias sshre='ssh -i ~/.ssh/kp-previpago-re.pem ubuntu@54.147.252.229'
alias sshre2='ssh -i ~/.ssh/kp-re2.pem ubuntu@3.235.91.111'

alias psqlpdev='ssh -fN -L 54320:previpago-dev.cg2rbyt3dqmt.us-east-1.rds.amazonaws.com:5432 bastion1; \
	export PGPASSWORD=CKgwhHG7ASWtc^69MS48
	psql -h localhost -p 54320 -U postgres -d previpago'
alias psqlpqa='ssh -fN -L 54321:previpago-qa.cg2rbyt3dqmt.us-east-1.rds.amazonaws.com:5432 previpago-qa; \
	export PGPASSWORD=CKgwhHG7ASWtc^69MS48
	psql -h localhost -p 54321 -U postgres -d previpago'
alias psqlpprod='ssh -fN -L 54322:previpago-qa.cg2rbyt3dqmt.us-east-1.rds.amazonaws.com:5432 previpago-qa; \
	export PGPASSWORD=CKgwhHG7ASWtc^69MS48
	psql -h localhost -p 54321 -U postgres -d previpago'
alias psqlplocal='export PGPASSWORD=Wezq7e8SZUcmFy9
	psql -h localhost -p 5432 -U previpago_local -d previpago'
alias psqlrdev='export PGPASSWORD=Wezq7e8SZUcmFy9
	psql -h 54.147.252.229 -p 5432 -U reonline'

