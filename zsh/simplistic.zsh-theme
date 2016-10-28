local ret_status="%(?:%{$fg[green]%}»:%{$fg[red]%}»)%{$reset_color%} "

## Git info
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[magenta]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=''
ZSH_THEME_GIT_PROMPT_DIRTY=''

git_info() {
  local git_info=$(git_prompt_info)
  if [ -n "$git_info" ]; then
    git_info="%{$fg[red]%} :%{$reset_color%}${git_info} "
  else
    git_info=" "
  fi
  echo -n "$git_info"
}

user_machine="%{$fg[cyan]%}%n@%m%{$reset_color%}"
date_time="%{$fg[green]%}%D{%d %b %Y %X}%{$reset_color%}"
PROMPT='
${user_machine} ${date_time} 
%{$fg[yellow]%}%c%{$reset_color%}$(git_info)${ret_status}'
