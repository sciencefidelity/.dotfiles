# Tell ls to be colorful
alias ls='ls --color=auto'
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

# Test the color of the terminal
true_color() {
  printf "\x1b[38;2;255;100;0mTRUECOLOR\x1b[0m\n"
}

# Tell grep to highlight matches
export GREP_OPTIONS='--color=auto'

export TERM="xterm-color"
PS1='\[\033[38;5;214m\]\u\[\033[38;5;230m\]@\[\033[38;5;142m\]\h\[\033[38;5;230m\]:\[\033[38;5;73m\]\w\[\033[38;5;230m\]\$ '

eval `dircolors ~/.dir_colors`

alias l='ls -f'
alias la='ls -Al' 
alias ll='ls -l'
