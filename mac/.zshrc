# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.cache/zsh/.zsh_history

fpath=( "${ZDOTDIR:-$HOME}/.zfunctions" $fpath )
# .zshrc
autoload -U promptinit; promptinit
prompt spaceship
SPACESHIP_VI_MODE_SHOW=false
SPACESHIP_USER_SHOW=always
SPACESHIP_HOST_SHOW=always

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Use lf to switch directories and bind it to ctrl-o
lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
bindkey -s '^o' 'lfcd\n'

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

bindkey '^ ' autosuggest-accept

export EDITOR=nvim
export VISUAL="$EDITOR"

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
# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# Plugins
source /Users/matt/dotfiles/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null
source /Users/matt/dotfiles/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
