#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# Tell ls to be colourful
alias ls='ls --color=auto'
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

# Test the color of the terminal
true_color() {
  printf '\x1b[38;2;255;100;0mTRUECOLOR\x1b[0m\n'
}

# Tell grep to highlight matches
export GREP_OPTIONS='--color=auto'

export TERM="xterm-color"
PS1='\[\033[38;5;212m\]\u\[\033[38;5;231m\]@\[\033[38;5;183m\]\h\[\033[38;5;231m\]:\[\033[38;5;120m\]\w\[\033[38;5;231m\]\$ '

eval `dircolors ~/.dir_colors`

alias l='ls -f'
alias la='ls -Al'
alias ll='ls -l'

alias ..='cd ../'

alias vi='vim'
alias mkdir='mkdir -p'

# for more human readable results
alias df='df -kTh'
alias free='free -h'

# Prevent typing for password too often
alias sudo='sudo -v; sudo '
