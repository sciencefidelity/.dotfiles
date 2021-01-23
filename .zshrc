# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000                                                                                                               
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install                                                                            
# The following lines were added by compinstall                                                                             
zstyle :compinstall filename '/home/matt/.zshrc'                                                                            
                                                                                                                            
autoload -Uz compinit                                                                                                       
compinit                                                                                                                    
# End of lines added by compinstall                                                                                         
                                                                                                                            
export TERM=xterm-256color                                                                                                  
                                                                                                                            
# Tell ls to be colourful                                                                                                   
alias ls='ls --color=auto'                                                                                                  
export CLICOLOR=1                                                                                                           
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx                                                                                      
                                                                                                                            
# Tell grep to highlight matches                                                                                            
# export GREP_OPTIONS='--color=auto'

# autoload -U colors && colors
PROMPT='%F{214}%n%f%F{230}@%f%F{142}%m%f %F{73}%~%f %F{230}%# '

eval `dircolors ~/.dir_colors`

alias l="ls"
alias ll="ls -l"
alias la="ls -al"
