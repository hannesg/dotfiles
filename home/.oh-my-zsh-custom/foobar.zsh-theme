
setopt PROMPT_SUBST

preexec() {
}

consume_executed() {
  echo '$_'
}

RPROMPT='%{$fg_bold[grey]%}%(?..[%{$fg_bold[red]%}exit %?%{$fg_bold[grey]%}])[%D{%K:%M}]%{$reset_color%}'
PROMPT='%{$fg_bold[green]%}%c%{$reset_color%}> '
