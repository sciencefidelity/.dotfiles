#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# Tell ls to be colourful
export CLICOLOR=1
export LSCOLORS=Exfxcxdxbxegedabagacad
                                                            
# Tell grep to highlight matches
export GREP_OPTIONS='--color=auto'

export TERM="xterm-color"
PS1='\[\033[38;5;214m\]\u\[\033[38;5;230m\]@\[\033[38;5;142m\]\h\[\033[38;5;230m\]:\[\033[38;5;73m\]\w\[\033[38;5;230m\]\$ '

eval `dircolors ~/.dir_colors`

alias l='ls -CF'
alias la='ls -A'
alias ll='ls -alF'
alias ls='ls --color=auto'
