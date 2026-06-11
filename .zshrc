# ── p10k instant prompt (MUST be first) ───────────────────
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ── Oh My Zsh (framework bootstrap) ───────────────────────
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
  git
  aliases
  colored-man-pages
  compleat
  docker
)

source $ZSH/oh-my-zsh.sh

# ── Modular config ─────────────────────────────────────────
for f (~/.config/zsh/*.zsh) source "$f"

# ── p10k (MUST be last) ────────────────────────────────────
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
