# Tell ls to be colourful
export CLICOLOR=1
export LSCOLORS=Exfxcxdxbxegedabagacad

# Tell grep to highlight matches
export GREP_OPTIONS='--color=auto'

export TERM="xterm-color"

autoload -U colors && colors
PS1="%{$fg[yellow]%}%n%{$reset_color%}@%{$fg[green]%}%m %{$fg[blue]%}%~ %{$reset_color%}%% "

alias ll="ls -l"
alias la="ls -al"
