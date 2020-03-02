LAST_GIT_PATH=""

find_git_branch() {
  local branch
  local CURRENT_PATH

  CURRENT_PATH="$(pwd)"

  if branch=$(git rev-parse --abbrev-ref HEAD 2> /dev/null); then

    if [ "$CURRENT_PATH" != "$LAST_GIT_PATH" ]; then
      (git remote update >/dev/null 2>&1 &)
    fi
    LAST_GIT_PATH="$CURRENT_PATH"

    if [[ "$branch" == "HEAD" ]]; then
      branch='detached*'
    fi
    git_branch="($branch)"
  else
    git_branch=""
  fi
}

find_git_dirty() {
  local status
  status="$(git status 2> /dev/null)"

  git_dirty=""

  if [[ "$status" =~ "Not a git repository" ]]; then
    return
  fi

  if [[ "$status" =~ "Untracked files" ]]; then
    git_dirty+="✴️ "
  elif [[ "$status" =~ "Changes not staged for commit" ]]; then
    git_dirty+="✴️ "
  fi

  if [[ "$status" =~ "Your branch is ahead of" ]]; then
    git_dirty+="⬆️ "
  fi

  if [[ "$status" =~ "Your branch is behind" ]]; then
    git_dirty+="⬇️ "
  fi

  if [[ $"$status" =~ "Changes to be committed" ]]; then
    git_dirty+="➡️ "
  fi

  if [[ $"$status" =~ "have diverged" ]]; then
    git_dirty+="🔀 "
  fi

  if [[ "$status" =~ "Your branch is up-to-date with" ]]; then
    if [ "$git_dirty" == "" ]; then
      git_dirty+="✅ "
    fi
  fi
}

#PROMPT_COMMAND="find_git_branch; find_git_dirty; $PROMPT_COMMAND"
PROMPT_COMMAND="find_git_branch; $PROMPT_COMMAND"
