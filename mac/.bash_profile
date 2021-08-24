# tell ls to be colourful
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

autoload -U colors && colors
export TERM="xterm-color"
PS1='\[\e[0;33m\]\u\[\e[0m\]@\[\e[0;32m\]\h\[\e[0m\]:\[\e[0;34m\]\w\[\e[0m\]\$ '

export EDITOR=nvim
export VISUAL="$EDITOR"

# tell grep to highlight matches
export GREP_OPTIONS='--color=auto'
eval $(gdircolors ~/.dir_colors)

# Load aliases and shortcuts if existent.
[ -f "$HOME/.config/shortcutrc.sh" ] && source "$HOME/.config/shortcutrc.sh"
[ -f "$HOME/.config/aliasrc.sh" ] && source "$HOME/.config/aliasrc.sh"

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

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
