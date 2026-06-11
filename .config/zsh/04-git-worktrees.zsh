# Create a new feature worktree branching from uat
# Usage: gwt-new <name> [base-branch]
gwt-new() {
  local branch="feat/${1:?Usage: gwt-new <name> [base-branch]}"
  local base="${2:-uat}"
  local folder="${branch//\//_}"

  if git show-ref --verify --quiet "refs/heads/$branch"; then
    echo "✗ Branch '$branch' already exists — use gwt-checkout instead" >&2
    return 1
  fi

  git worktree add -b "$branch" "$folder" "$base" || {
    echo "✗ Failed to create worktree '$folder'" >&2
    return 1
  }

  cd "$folder" || {
    echo "✗ Worktree created but could not cd into '$folder'" >&2
    return 1
  }

  echo "✓ Worktree '$folder' created on branch '$branch'"
  echo "  Run: npm ci"
}

# Check out an existing remote branch as a worktree
# Usage: gwt-checkout bugfix/webview
gwt-checkout() {
  local branch="${1:?Usage: gwt-checkout <branch>}"
  local folder="${branch//\//_}"

  git worktree add "$folder" "$branch" || {
    echo "✗ Failed to checkout '$branch' — does it exist on remote?" >&2
    return 1
  }

  cd "$folder" || {
    echo "✗ Worktree created but could not cd into '$folder'" >&2
    return 1
  }

  echo "✓ Worktree '$folder' checked out on branch '$branch'"
}

# Remove a worktree — accepts branch name or folder name
# Usage: gwt-rm feat/my-feature   OR   gwt-rm feat_my-feature
gwt-rm() {
  local input="${1:?Usage: gwt-rm <branch-or-folder>}"
  local folder="${input//\//_}"

  if ! git worktree list --porcelain | grep -q "$folder"; then
    echo "✗ No worktree found matching '$folder'" >&2
    return 1
  fi

  git worktree remove "$folder" --force || {
    echo "✗ Failed to remove worktree '$folder'" >&2
    return 1
  }

  echo "✓ Removed worktree: $folder"
}

# cd into a worktree by partial name, or fzf picker if no arg
# Usage: gwt uat   OR   gwt (shows picker)
gwt-go() {
  if [[ -z "$1" ]]; then
    if command -v fzf &>/dev/null; then
      local pick
      pick=$(git worktree list | fzf --height=40% | awk '{print $1}')
      [[ -n "$pick" ]] && cd "$pick"
    else
      git worktree list
    fi
  else
    local match
    match=$(git worktree list --porcelain \
      | awk '/^worktree/{print $2}' \
      | grep "$1" \
      | head -1)
    if [[ -n "$match" ]]; then
      cd "$match"
    else
      echo "✗ No worktree matching: $1" >&2
      return 1
    fi
  fi
}
