# Keep 1000 lines of history within the shell and save it to ~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

if [[ "$TERM" == "xterm-256color" && "$(uname)" == "Linux" ]]; then
    export TERM=xterm-24bits
fi

fpath=( "${ZDOTDIR:-$HOME}/.zfunctions" $fpath )
autoload -U promptinit; promptinit
prompt spaceship
SPACESHIP_VI_MODE_SHOW=false
SPACESHIP_USER_SHOW=always
SPACESHIP_HOST_SHOW=always
SPACESHIP_PROMPT_ADD_NEWLINE=false

# Basic auto/tab complete
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu
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

# Edit line in vim with ctrl-e
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

bindkey '^ ' autosuggest-accept

export EDITOR=nvim
export VISUAL="$EDITOR"
export BAT_THEME="Dracula"

# add color to man pages
export MANROFFOPT='-c'
export LESS_TERMCAP_mb=$(tput bold; tput setaf 2)
export LESS_TERMCAP_md=$(tput bold; tput setaf 6)
export LESS_TERMCAP_me=$(tput sgr0)
export LESS_TERMCAP_so=$(tput bold; tput setaf 3; tput setab 4)
export LESS_TERMCAP_se=$(tput rmso; tput sgr0)
export LESS_TERMCAP_us=$(tput smul; tput bold; tput setaf 7)
export LESS_TERMCAP_ue=$(tput rmul; tput sgr0)
export LESS_TERMCAP_mr=$(tput rev)
export LESS_TERMCAP_mh=$(tput dim)

# Load aliases and shortcuts
[ -f "$HOME/.config/zsh/alias.sh" ] && source "$HOME/.config/zsh/alias.sh"
[ -f "$HOME/.config/zsh/path.sh" ] && source "$HOME/.config/zsh/path.sh"
[ -f "$HOME/.config/zsh/tmux.sh" ] && source "$HOME/.config/zsh/tmux.sh"

# Plugins
source ~/dotfiles/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null
source ~/dotfiles/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

