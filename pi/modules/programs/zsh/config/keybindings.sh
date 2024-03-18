bindkey -v
bindkey "^ " autosuggest-accept
bindkey -M menuselect "h" vi-backward-char
bindkey -M menuselect "k" vi-up-line-or-history
bindkey -M menuselect "l" vi-forward-char
bindkey -M menuselect "j" vi-down-line-or-history
bindkey -v "^?" backward-delete-char
bindkey -s "^o" "lfcd\n"
bindkey "^e" edit-command-line
