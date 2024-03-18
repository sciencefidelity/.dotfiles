autoload -U colors && colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%(3~|./%2~|%~)%{$fg[red]%}]%{$reset_color%}$%b "

eval "$(ssh-agent -s)" > /dev/null
ssh-add ~/.ssh/github 2> /dev/null
export GPG_TTY=$(tty)

autoload edit-command-line; zle -N edit-command-line

export PATH="$HOME/.npm-globals/bin:$PATH"
