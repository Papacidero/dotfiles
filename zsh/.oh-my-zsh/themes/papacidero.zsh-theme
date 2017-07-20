local ret_status="%(?:%{$fg_bold[white]%}😀 :%{$fg_bold[red]%}💩 %s)"
#PROMPT='${ret_status}%{$fg_bold[green]%}%p %{$fg[cyan]%}(%~) %{$fg_bold[blue]%}$(git_prompt_info)$(check_branch)%{$fg_bold[blue]%} % %{$reset_color%}
PROMPT='${ret_status}%{$fg_bold[green]%}%p %{$fg[cyan]%}(%~) %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}
$fg_bold[white]%}🇺🇸  ✈️ %{$reset_color%} '

BRANCH=''
REQUIRED_BRANCH='develop'

ZSH_THEME_GIT_PROMPT_PREFIX="$fg_bold[yellow]%} %{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%} %{$fg[yellow]%}⚠️%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%}"

function check_branch {
    BRANCH=$(git rev-parse --abbrev-ref HEAD)
    if ! [[ $BRANCH == $REQUIRED_BRANCH ]]; then
        echo %{$fg_bold[yellow]%}'⚠︎ Warn!' %{$fg_bold[red]%}'Not on' $REQUIRED_BRANCH
    fi
}