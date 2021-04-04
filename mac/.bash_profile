# tell ls to be colourful
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

# tell grep to highlight matches
export GREP_OPTIONS='--color=auto'

autoload -U colors && colors
export TERM="xterm-color"
PS1='\[\e[0;33m\]\u\[\e[0m\]@\[\e[0;32m\]\h\[\e[0m\]:\[\e[0;34m\]\w\[\e[0m\]\$ '

alias l='ls -f --color=auto'
alias ll='ls -lh --color=auto'
alias la='ls -Alh --color=auto'

alias -s {cs,js,html}=nova
export GPG_TTY=$(tty)
