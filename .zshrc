#
# ~/.zshrc
#

HISTFILE=~/.histfile
HISTSIZE=100
SAVEHIST=100
bindkey -e

zstyle :compinstall filename '/home/matt/.zshrc'

autoload -Uz compinit
compinit

# Tell ls to be colourful
export TERM=xterm-256color
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

# Test the color of the terminal
truecolor() {
  printf "\x1b[38;2;255;100;0mTRUECOLOR\x1b[0m\n"
}

# Tell grep to highlight matches
export GREP_OPTIONS='--color=auto'

# autoload -U colors && colors
PROMPT='%F{214}%n%f%F{230}@%f%F{142}%m%f %F{73}%~%f %F{230}%# '

eval `dircolors ~/.dir_colors`

alias l='ls -f --color=auto'
alias ll='ls -lh --color=auto'
alias la='ls -Alh --color=auto'

alias ..='cd ..'

# Prevent typing password too often
alias sudo="sudo -v; sudo "
