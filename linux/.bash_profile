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

# synchronise dotfiles
push_dotfiles() {
  bash /home/matt/bin/push-dotfiles.sh
}
pull_dotfiles() {
  bash /home/matt/bin/pull-dotfiles.sh
}

# tell grep to highlight matches
export GREP_OPTIONS='--color=auto'

# prompt
export TERM="xterm-color"
PS1='\[\e[0;35m\]\u\[\e[0m\]@\[\e[0;34m\]\h\[\e[0m\]:\[\e[0;33m\]\w\[\e[0m\]\$ '

eval `dircolors ~/.dir_colors`

alias l='ls -f --color=auto'
alias la='ls -Alh --color=auto'             # show hidden files
alias lx='ls -lXB'                          # sort by extension
alias ll='ls -lv --group-directories-first' # directories first, alphanumeric sorting
alias lr='ll -R'                            # recursive

alias ..='cd ..'

# for more human readable results
alias df='df -kTh'
alias free='free -h'

# Git aliases
alias push='eval "$(ssh-agent -s)"; ssh-add ~/.ssh/github; git push'
alias pull='eval "$(ssh-agent -s)"; ssh-add ~/.ssh/github; git fetch origin; git merge origin/main'

# prevent typing password too often
alias sudo='sudo -v; sudo '

# path to Go
export PATH=$PATH:/usr/local/src/go/bin
# path to Dart
export PATH=$PATH:/usr/local/src/dart-sdk/bin
# path to hugo
export PATH="~/go/bin:$PATH"
