#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# Tell ls to be colourful
alias ls='ls --color=auto'
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

# Test the color of the terminal
truecolor() {
  printf '\x1b[38;2;255;100;0mTRUECOLOR\x1b[0m\n'
}

# Tell grep to highlight matches
export GREP_OPTIONS='--color=auto'

export TERM="xterm-color"
PS1='\[\033[38;5;214m\]\u\[\033[38;5;230m\]@\[\033[38;5;142m\]\h\[\033[38;5;230m\]:\[\033[38;5;73m\]\w\[\033[38;5;230m\]\$ '

eval `dircolors ~/.dir_colors`

alias l='ls -f --color=auto'
alias la='ls -Al --color=auto'
alias ll='ls -l --color=auto'

alias ..='cd ../'

# Prevent typing for password too often
alias sudo='sudo -v; sudo '
