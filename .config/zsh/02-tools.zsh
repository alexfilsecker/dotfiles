# pyenv
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# fnm — suppress output to avoid p10k instant prompt warning
{ eval "$(fnm env --use-on-cd --shell zsh)"; } &>/dev/null
