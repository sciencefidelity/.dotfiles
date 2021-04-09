#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# tell ls to be colourful
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

# test the color of the terminal
truecolor() {
  printf '\x1b[38;2;255;100;0mTRUECOLOR\x1b[0m\n'
}

# tell grep to highlight matches
export GREP_OPTIONS='--color=auto'

export TERM="xterm-color"
PS1='\[\e[0;35m\]\u\[\e[0m\]@\[\e[0;34m\]\h\[\e[0m\]:\[\e[0;33m\]\w\[\e[0m\]\$ '

eval `dircolors ~/.dir_colors`

alias l='ls -f --color=auto'
alias ll='ls -lh --color=auto'
alias la='ls -Alh --color=auto'

alias ..='cd ..'

# Git push alias
alias push='eval "$(ssh-agent -s)"; ssh-add ~/.ssh/github; git push'

# prevent typing password too often
alias sudo='sudo -v; sudo '

# path to Go
export PATH=$PATH:/usr/local/src/go/bin
# path to Dart
export PATH=$PATH:/usr/local/src/dart-sdk/bin
# path to hugo
export PATH="~/go/bin:$PATH"
