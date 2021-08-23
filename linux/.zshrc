# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.cache/zsh/.zsh_history

fpath=( "${ZDOTDIR:-$HOME}/.zfunctions" $fpath )
autoload -U promptinit; promptinit
prompt spaceship
SPACESHIP_VI_MODE_SHOW=false

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

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

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

# Load aliases and shortcuts if existent.
[ -f "$HOME/.config/shortcutrc" ] && source "$HOME/.config/shortcutrc"
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"

# synchronise dotfiles
pull_dotfiles() {
  cp ~/dotfiles/linux/.zshrc ~/
  cp ~/dotfiles/linux/.bash_profile ~/
  cp ~/dotfiles/linux/.dir_colors ~/
  cp -R ~/dotfiles/linux/nvim ~/.config/
}
push_dotfiles() {
  cp ~/.zshrc ~/dotfiles/linux/
  cp ~/.bash_profile ~/dotfiles/linux/
  cp ~/.dir_colors ~/dotfiles/linux/
  cp -R ~/.config/nvim ~/dotfiles/linux/
}
alias pd='pull_dotfiles'

# Tell grep to highlight matches
export GREP_OPTIONS='--color=auto'

eval `dircolors ~/.dir_colors`

alias ls='ls --color=auto --group-directories-first'
alias l='ls -f'
alias la='ls -Alh'
alias lx='ls -lXB'
alias ll='ls -lv'
alias lr='ll -R'

alias ..='cd ..'
alias mkdir='mkdir -p'

# for more human readable results
alias df='df -kTh'
alias free='free -h'

# Always use Neovim
alias vi='nvim'
alias vim='nvim'

# Git aliases
alias push='eval "$(ssh-agent -s)"; ssh-add ~/.ssh/github; git push'
alias pull='eval "$(ssh-agent -s)"; ssh-add ~/.ssh/github; git fetch origin; git merge origin/main'
gitpush() {
  git add .
  git commit -m "$*"
  git pull
  git push
}
gitupdate() {
  eval "$(ssh-agent -s)"
  ssh-add ~/.ssh/github
  ssh -T git@github.com
}
alias gp=gitpush
alias gu=gitupdate
alias gst='git status'
alias lg='lazygit'

# Prevent typing password too often
alias sudo="sudo -v; sudo "

# # ext - archive extractor
# # usage: ext <file>
ext ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2) tar xjf $1;;
      *.tar.gz) tar xzf $1;;
      *.tar.xz) tar xJf $1;;
      *.bz2) bunzip2 $1;;
      *.rar) unrar x $1;;
      *.gz) gunzip $1 ;;
      *.tar) tar xf $1 ;;
      *.tbz2) tar xjf $1;;
      *.tgz) tar xzf $1;;
      *.zip) unzip $1;;
      *.Z) uncompress $1;;
      *.7z) 7z x $1;;
      *) echo "'$1' cannot be extracted via ex()";;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}


# path to Go
export PATH=$PATH:/usr/local/src/go/bin
# path to Dart
export PATH=$PATH:/usr/local/src/dart-sdk/bin
# path to Hugo
export PATH="~/go/bin:$PATH"
# path to LF
export PATH=$PATH:/usr/local/src/bin

# Plugins
source ~/dotfiles/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null
source ~/dotfiles/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
