export TERM=xterm-256color

# Tell ls to be colourful
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

# Tell grep to highlight matches
export GREP_OPTIONS="--color=auto"

autoload -U colors && colors
PS1="%{$fg[magenta]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg[yellow]%}%~ %{$reset_color%}%# "

alias l="ls -f"
alias ll="ls -lh"
alias la="ls -Alh"
alias ..="cd .."

# Open in Nova
alias -s {cs,js,html}=nova

# GPG sign git commits
export GPG_TTY=$(tty)
