ZSH_THEME_GIT_PROMPT_PREFIX="\ue0a0 <"
ZSH_THEME_GIT_PROMPT_SUFFIX=">"
ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_ADDED="+"
ZSH_THEME_GIT_PROMPT_MODIFIED="!"
ZSH_THEME_GIT_PROMPT_DELETED="✗"
ZSH_THEME_GIT_PROMPT_RENAMED="»"
ZSH_THEME_GIT_PROMPT_UNMERGED="="
ZSH_THEME_GIT_PROMPT_UNTRACKED="?"
ZSH_THEME_GIT_PROMPT_STASHED="$"
ZSH_THEME_GIT_PROMPT_AHEAD="⇡"
ZSH_THEME_GIT_PROMPT_BEHIND="⇣"
ZSH_THEME_GIT_PROMPT_DIVERGED="⇕"

newline="
"

function prompt_char {
    if [ "$(id -u)" != 0 ];then
        echo "%{$fg[green]%}$ %{$reset_color%}"
    else
        echo "%{$fg[green]%}# %{$reset_color%}"
    fi
}

function directory {
    var_dir="%~"
    if [ "$(git_repo_name)" != "" ];then 
        var_dir=$(git_repo_name)
    fi
    echo "%{$fg[cyan]%}$var_dir%{$reset_color%} "
}

function git_status {
    if [ "$(git_prompt_status)" != "" ];then 
        echo "%{$fg[red]%} [$(git_prompt_status)]%{$reset_color%}"
    fi
}

function git_info {
    if [ "$(git_prompt_info)" != "" ];then 
        echo "on %{$fg[magenta]%}$(git_prompt_info)%{$reset_color%}$(git_status) "
    fi
}

function user_info {
    if [ "$(id -u)" = 0 ];then
        echo "%{$fg[red]%}%n%{$reset_color%} at %{$fg[blue]%}%m%{$reset_color%} in "
    fi
}

PROMPT='$newline$(user_info)$(directory)$(git_info)$newline$(prompt_char)'
RPROMPT=''
