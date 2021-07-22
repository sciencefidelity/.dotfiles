# tell ls to be colourful
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

# tell grep to highlight matches
export GREP_OPTIONS='--color=auto'

# synchronise dotfiles
push_dotfiles() {
  bash /Users/matt/dotfiles/mac/bin/push-dotfiles.sh
}
pull_dotfiles() {
  bash /Users/matt/dotfiles/mac/bin/pull-dotfiles.sh
}

autoload -U colors && colors
export TERM="xterm-color"
PS1='\[\e[0;33m\]\u\[\e[0m\]@\[\e[0;32m\]\h\[\e[0m\]:\[\e[0;34m\]\w\[\e[0m\]\$ '

alias l='ls -f --color=auto'
alias ll='ls -lh --color=auto'
alias la='ls -Alh --color=auto'

alias ..='cd ..'

# Git aliases
alias push='eval "$(ssh-agent -s)"; ssh-add ~/.ssh/github; git push'
alias pull='eval "$(ssh-agent -s)"; ssh-add ~/.ssh/github; git fetch origin; git merge origin/main'

# open in Nova
alias -s {cs,js,html}=nova

# PATHS
# android sdk
export ANDROID_SDK=$HOME/Library/Android/sdk
export PATH=$ANDROID_SDK/emulator:$ANDROID_SDK/tools:$PATH
# brave browser (standing in for chrome)
export CHROME_EXECUTABLE="/Applications/Brave Browser.app/Contents/MacOS/Brave Browser"
# dart executables
export PATH="$PATH":"$HOME/.pub-cache/bin"
# deno executables
export PATH="/Users/matt/.deno/bin:$PATH"
# flutter
export PATH="$PATH:/usr/local/flutter/bin"
# php8.0
export PATH="/usr/local/opt/php@8.0/bin:$PATH"
