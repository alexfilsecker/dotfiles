# Note: compinit is already called by Oh My Zsh — do NOT call it again here

# ─── Helpers ──────────────────────────────────────────────────────

__gwt_worktrees() {
  local -a wts
  local first=true
  while IFS= read -r line; do
    if [[ "$line" == worktree\ * ]]; then
      if $first; then
        first=false
        continue  # skip root
      fi
      wts+=("$(basename "${line#worktree }")")
    fi
  done < <(git worktree list --porcelain 2>/dev/null)
  _describe 'worktrees' wts
}

__gwt_local_branches() {
  local -a branches
  branches=(${(f)"$(git branch --format='%(refname:short)' 2>/dev/null)"})
  _describe 'local branches' branches
}

__gwt_remote_branches() {
  local -a remote checked available
  remote=(${(f)"$(git branch -r --format='%(refname:short)' 2>/dev/null \
    | sed 's|origin/||' \
    | grep -v '^HEAD')"})
  checked=(${(f)"$(git worktree list --porcelain 2>/dev/null \
    | awk '/^branch/{sub(/refs\/heads\//, ""); print $2}')"})
  for b in "${remote[@]}"; do
    [[ ! "${checked[(r)$b]}" ]] && available+=("$b")
  done
  _describe 'remote branches' available
}

# ─── Completion functions ──────────────────────────────────────────

_gwt-new() {
  case $CURRENT in
    2) _message 'feature name (creates feat/<name>)' ;;
    3) __gwt_local_branches ;;
  esac
}

_gwt-checkout() { __gwt_remote_branches }
_gwt-rm()       { __gwt_worktrees }
_gwt-go()          { __gwt_worktrees }

# ─── Register ──────────────────────────────────────────────────────

compdef _gwt-new      gwt-new
compdef _gwt-checkout gwt-checkout
compdef _gwt-rm       gwt-rm
compdef _gwt-go       gwt-go
