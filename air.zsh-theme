local resetColor="%{$reset_color%}"
local dir="%{$fg_bold[white]%}%c$resetColor$resetColor"

GIT_PROMPT_PREFIX="[%{$fg_bold[white]%}"
GIT_PROMPT_SUFFIX="$resetColor] "
GIT_PROMPT_DIRTY="%{$fg_bold[red]%}"
GIT_PROMPT_CLEAN="%{$fg_bold[green]%}"

function git_prompt() {
  branch=`arc info | grep 'branch:' | sed 's/branch: //'`
  if [ "$branch" = '' ]; then
    # not a git repo
    echo ''
  else
    echo "$GIT_PROMPT_PREFIX$GIT_PROMPT_CLEAN$branch$GIT_PROMPT_SUFFIX"
  fi
}

PROMPT='➜ $dir $(git_prompt)'
