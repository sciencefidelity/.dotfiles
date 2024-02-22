HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

export GPG_TTY=$(tty)
eval "$(starship init zsh)"
setopt autocd

export EDITOR=nvim
export VISUAL="$EDITOR"
export COLORTERM=truecolor
export STARSHIP_CONFIG=$HOME/.config/starship/starship.toml

bindkey "^ " autosuggest-accept

cn() { cargo new "$@" && cd "$@"; }
gm() { mkdir "$@" && cd "$@" && go mod init github.com/sciencefidelity/"$@"; }

alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias sudo=doas
alias vi=nvim
alias vim=nvim
alias ls='eza -F --group-directories-first'
alias l='eza -AF --group-directories-first'
alias la='eza -lAF --group-directories-first --git'
alias ll='eza -lF --group-directories-first --git'
alias lt='eza -T --git-ignore'
alias lr='eza -R --git-ignore'

export PATH=$PATH:$(go env GOPATH)/bin
export PATH="$HOME/.cargo/bin:$PATH"

source ~/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source /home/matt/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
