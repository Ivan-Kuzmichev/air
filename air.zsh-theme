local resetColor="%{$reset_color%}"
local dir="%{$fg[cyan]%}%c$resetColor$resetColor"
local time="%{$fg[blue]%}%D{[%H:%M:%S]}$resetColor"
local icon="%{$fg[blue]%}➜$resetColor"

REPOSIRORY_PROMPT_PREFIX="(%{$fg[blue]%}"
REPOSIRORY_PROMPT_SUFFIX="$resetColor) "

function print_branch() {
    if [ "$1" = '' ]; then
        echo ''
    else
        [[ $2 = '' ]] && CHANGES="" || CHANGES=" *"
        echo "$REPOSIRORY_PROMPT_PREFIX$1$CHANGES$REPOSIRORY_PROMPT_SUFFIX"
    fi
}

function git_prompt() {
    arcadia=`pwd | grep 'arcadia'`

    if [[ $arcadia == '' ]]; then
        branch=`git_current_branch`
        changes=`git status | grep 'Changes not staged for commit'`
    else
        branch=`arc info | grep 'branch:' | sed 's/branch: //'`
        changes=`arc status | grep 'Changes not staged for commit'`
    fi

    print_branch $branch $changes
}

PROMPT='$icon $time $dir $(git_prompt)'
