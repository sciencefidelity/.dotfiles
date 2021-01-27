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
alias ls='ls --color=auto'                                                                                                  
export CLICOLOR=1                                                                                                           
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx                                                                                      
                                                                                                                            
# Tell grep to highlight matches                                                                                            
export GREP_OPTIONS='--color=auto'

# autoload -U colors && colors
PROMPT='%F{214}%n%f%F{230}@%f%F{142}%m%f %F{73}%~%f %F{230}%# '

eval `dircolors ~/.dir_colors`

alias l="ls -f"
alias ll="ls -l"
alias la="ls -Al"

alias sudo="sudo -v; sudo "
