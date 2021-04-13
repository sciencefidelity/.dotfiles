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

# synchronise dotfiles
push_dotfiles() {
  zsh /home/matt/bin/push-dotfiles.sh
}
pull_dotfiles() {
  zsh /home/matt/bin/pull-dotfiles.sh
}

# Tell grep to highlight matches
export GREP_OPTIONS='--color=auto'

# prompt
# autoload -U colors && colors
PS1='%{$fg[magenta]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg[yellow]%}%~ %{$reset_color%}%# '

eval `dircolors ~/.dir_colors`

alias l='ls -f --color=auto'
alias la='ls -Alh --color=auto'             # show hidden files
alias lx='ls -lXB'                          # sort by extension
alias ll='ls -lv --group-directories-first' # directories first, alphanumeric sorting
alias lr='ll -R'                            # recursive

alias ..='cd ..'

alias vi='vim'
alias mkdir='mkdir -p'

# for more human readable results
alias df='df -kTh'
alias free='free -h'

# Git aliases
alias push='eval "$(ssh-agent -s)"; ssh-add ~/.ssh/github; git push'
alias pull='eval "$(ssh-agent -s)"; ssh-add ~/.ssh/github; git fetch origin; git merge origin/main'

# Prevent typing password too often
alias sudo="sudo -v; sudo "

# path to Go
export PATH=$PATH:/usr/local/src/go/bin
# path to Dart
export PATH=$PATH:/usr/local/src/dart-sdk/bin
# path to hugo
export PATH="~/go/bin:$PATH"
