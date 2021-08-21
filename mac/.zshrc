# export TERM=xterm-256color

# tell ls to be colourful
# export CLICOLOR=1
# export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

# tell grep to highlight matches
export GREP_OPTIONS='--color=auto'

# synchronise dotfiles
push_dotfiles() {
  zsh /Users/matt/dotfiles/mac/bin/push-dotfiles.sh
}
pull_dotfiles() {
  zsh /Users/matt/dotfiles/mac/bin/pull-dotfiles.sh
}

# autoload -U colors && colors
# PS1="%{$fg[magenta]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg[yellow]%}%~ %{$reset_color%}%# "

alias l='ls -f'
alias ll='ls -l'
alias la='ls -Al'

alias ..='cd ..'

# open in Nova
alias -s {cs,js,html}=nova

# Git aliases
alias push='eval "$(ssh-agent -s)"; ssh-add ~/.ssh/github; git push'
alias pull='eval "$(ssh-agent -s)"; ssh-add ~/.ssh/github; git fetch origin; git merge origin/main'

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

# Load Dracula theme
source /Users/matt/dotfiles/zsh/dracula/dracula.zsh-theme 2>/dev/null
DRACULA_DISPLAY_TIME=1
DRACULA_DISPLAY_CONTEXT=1
DRACULA_ARROW_ICON="-> "

source /Users/matt/dotfiles/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
