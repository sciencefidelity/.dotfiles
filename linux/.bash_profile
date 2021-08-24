#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# tell ls to be colourful
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

# prompt
export TERM="xterm-color"
PS1='\[\e[0;35m\]\u\[\e[0m\]@\[\e[0;34m\]\h\[\e[0m\]:\[\e[0;33m\]\w\[\e[0m\]\$ '

# test the color of the terminal
truecolor() {
  printf '\x1b[38;2;255;100;0mTRUECOLOR\x1b[0m\n'
}

export EDITOR=nvim

# tell grep to highlight matches
export GREP_OPTIONS='--color=auto'
eval `dircolors ~/.dir_colors`

# Load aliases and shortcuts if existent.
[ -f "$HOME/.config/shortcutrc.sh" ] && source "$HOME/.config/shortcutrc.sh"
[ -f "$HOME/.config/aliasrc.sh" ] && source "$HOME/.config/aliasrc.sh"

# path to Go
export PATH=$PATH:/usr/local/src/go/bin
# path to Deno
export PATH=$PATH:/usr/local/src/deno
# path to Dart
export PATH=$PATH:/usr/local/src/dart-sdk/bin
export PATH="$PATH":"$HOME/.pub-cache/bin"
# path to hugo
export PATH="~/go/bin:$PATH"

