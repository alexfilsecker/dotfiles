# ── p10k ─ instant prompt (MUST be first) ──────────────────
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ── Exports & PATH ────────────────────────────────────────
export ZSH="$HOME/.oh-my-zsh"
export EDITOR="vim"

# ── Oh My Zsh config ──────────────────────────────────────
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

# ── Aliases ───────────────────────────────────────────────
# .... Normal file exploring ...............................
alias ll="ls -la"

# .... Dotfiles ────────────────────────────────────────────
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias lazyconfig='lazygit --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# ── Tools  ────────────────────────────────────────────────
# .... pyenv ...............................................
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# .... fnm .................................................
eval "$(fnm env --use-on-cd --shell zsh)"

# ── p10k (MUST be last) ───────────────────────────────────
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

