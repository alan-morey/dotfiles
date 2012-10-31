ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg_bold[red]%}⚡"
ZSH_THEME_GIT_PROMPT_CLEAN=""

function prompt_char {
	if [ $UID -eq 0 ]; then echo "%{$fg_bold[yellow]%}☢%{$reset_color%}"; else echo "%{$fg[green]%}⧐%{$reset_color%}"; fi
}

PROMPT='%(?, ,%{$fg_bold[red]%}Fail ☣ $?%{$reset_color%}
)
%{$fg_bold[red]%}%n%{$reset_color%}@%{$fg_bold[yellow]%}%m%{$reset_color%}: %{$fg_bold[cyan]%}%~%{$reset_color%}$(git_prompt_info)
%_$(prompt_char) '

RPROMPT='%{$fg_bold[green]%}⌚ %*%{$reset_color%}'
