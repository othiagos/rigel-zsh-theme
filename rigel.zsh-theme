ZSH_THEME_GIT_PROMPT_PREFIX=" <"
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

d_ms=0
newline="
"

setopt prompt_subst

function preexec() {
    cmd_start=$(($(print -P %D{%s%6.}) / 1000))
}

function precmd() {
    if [ $cmd_start ]; then
        local now=$(($(print -P %D{%s%6.}) / 1000))
        d_ms=$(($now - $cmd_start))
        local d_s=$((d_ms / 1000))
        local ms=$((d_ms % 1000))
        local s=$((d_s % 60))
        local m=$(((d_s / 60) % 60))
        local h=$((d_s / 3600))

        if   ((h > 0)); then cmd_time=${h}h${m}m
        elif ((m > 0)); then cmd_time=${m}m${s}s
        elif ((s > 9)); then cmd_time=${s}.$(printf %03d $ms | cut -c1-2)s # 12.34s
        elif ((s > 0)); then cmd_time=${s}.$(printf %03d $ms)s # 1.234s
        else cmd_time=${ms}ms
        fi

        unset cmd_start
    else
        unset cmd_time
    fi
}

function elapsed_time {
    if [ ${#cmd_time} -gt 0 ] && [ $d_ms -gt 2000 ];then
        echo "took %{$fg[yellow]%} $cmd_time%{$reset_color%}"
    fi  
}

function prompt_char {
    if [ "$(id -u)" != 0 ];then
        echo "%{$fg[green]%}$ %{$reset_color%}"
    else
        echo "%{$fg[green]%}# %{$reset_color%}"
    fi
}

function directory {
    local curr_dir=$(pwd)
    local home_dir=$(eval echo ~)

    if [[ $curr_dir == $home_dir* ]];then
        curr_dir="~${curr_dir#$home_dir}"
    fi

    if [ "$(git_repo_name)" != "" ];then
        curr_dir=${$(pwd)/*$(git_repo_name)/$(git_repo_name)}
    fi

    echo "%{$fg[cyan]%} $curr_dir%{$reset_color%} "
}

function git_status {
    if [ "$(git_prompt_status)" != "" ];then
        echo "%{$fg[red]%} [$(git_prompt_status)]%{$reset_color%}"
    fi
}

function git_info {
    if [ "$(git_prompt_info)" != "" ];then
        echo "on %{$fg[green]%}$(git_prompt_info)%{$reset_color%}$(git_status) "
    fi
}

function user_info {
    if [ "$USER_INFO_DISABLE_PROMPT" != "" ] && [ "$USER_INFO_DISABLE_PROMPT" = "0" ];then
        echo "%{$fg[yellow]%}$(whoami)%{$reset_color%} at %{$fg[blue]%}$(uname -n)%{$reset_color%} in "
    fi
}

function virtualenv_info {
    if [ "$VIRTUAL_ENV_DISABLE_PROMPT" = "0" ] && [ "$VIRTUAL_ENV" != "" ];then
        echo "%{$fg[blue]%}($(basename $VIRTUAL_ENV))%{$reset_color%} "
    fi
}

function space_before_command {
    if [ "$SPACE_BEFORE_COMMAND_DISABLE_PROMPT" != "" ] && [ "$SPACE_BEFORE_COMMAND_DISABLE_PROMPT" = "0" ];then
        echo "$newline\0"
    fi
}

function get_space {
    local free_space=$(tput cols)

    local use_text="$(virtualenv_info)$(user_info)$(directory)$(git_info)$(elapsed_time)"
    use_text=$(echo $use_text | sed -r "s/\x1B\[([0-9]{1,3}(;[0-9]{1,3})*)?[mGK]//g" | sed 's/%{[^}]*}//g')

    free_space=$(($free_space - ${#use_text}))
    local space=""

    for ((i = 0; i < free_space; i++));do
        space+=" "
    done

    echo "$space"
}

PROMPT='$(space_before_command)$(virtualenv_info)$(user_info)$(directory)$(git_info)$(get_space)$(elapsed_time)$newline$(prompt_char)'
RPROMPT=''
