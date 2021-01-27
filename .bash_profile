#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# Tell ls to be colourful
alias ls='ls --color=auto'
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

# Tell grep to highlight matches
export GREP_OPTIONS='--color=auto'

export TERM="xterm-color"
PS1='\[\033[38;5;214m\]\u\[\033[38;5;230m\]@\[\033[38;5;142m\]\h\[\033[38;5;230m\]:\[\033[38;5;73m\]\w\[\033[38;5;230m\]\$ '

eval `dircolors ~/.dir_colors`

alias l='ls -f'
alias la='ls -Al' 
alias ll='ls -l'

alias sudo="sudo -v; sudo "
