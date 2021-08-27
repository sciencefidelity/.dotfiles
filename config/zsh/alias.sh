# synchronise dotfiles
pull_dotfiles() {
  echo 'Updating dotfiles'
  cp ~/dotfiles/.zshrc ~/
  cp -R ~/dotfiles/config/zsh ~/.config/
  cp ~/dotfiles/.tmux.conf ~/
  cp ~/dotfiles/config/emacs.d/init.el ~/.emacs.d/
  cp ~/dotfiles/config/nvim/init.lua ~/.config/nvim/
  cp -R ~/dotfiles/config/nvim/lua ~/.config/nvim/
  if [[ "$(uname)" == "Darwin" ]]; then
    cp ~/dotfiles/config/kitty/kitty.conf ~/.config/kitty/
  fi
  . ~/.zshrc
}
push_dotfiles() {
  cp ~/.zshrc ~/dotfiles/
  cp -R ~/.config/zsh ~/dotfiles/config/
  cp ~/.tmux.conf ~/dotfiles/
  cp ~/.emacs.d/init.el ~/dotfiles/config/emacs.d/
  cp ~/.config/nvim/init.lua ~/dotfiles/config/nvim/
  cp -R ~/.config/nvim/lua ~/dotfiles/config/nvim/
  if [[ "$(uname)" == "Darwin" ]]; then
    cp ~/.config/karabiner/karabiner.json ~/dotfiles/config/karabiner/
    cp ~/.config/kitty/kitty.conf ~/dotfiles/config/kitty/
  fi
}
alias pd='pull_dotfiles'

# fix ssh with kitty: https://sw.kovidgoyal.net/kitty/faq/
alias ssh="kitty +kitten ssh"

# https://the.exa.website/docs/command-line-options
alias ls='exa -F --group-directories-first'
alias l='exa -aF --group-directories-first'
alias la='exa -laF --group-directories-first --git --git-ignore'
alias ll='exa -lF --group-directories-first --git --git-ignore'
alias lt='exa -T --git-ignore'
alias lr='exa -R --git-ignore'

alias ..='cd ..'
alias ...='cd ../..'
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias mkdir='mkdir -p'

alias grep='grep --color=auto'
# for more human readable results
alias df='df -kTh'
alias free='free -h'
alias du='du -h -c' # calculate disk usage for a folder

# always use Neovim
alias vi='nvim'
alias vim='nvim'
# open emacs with truecolor
alias emacs='TERM=xterm-24bit emacs -nw'

# open in Nova
alias -s {cs,js,html}=nova

# Git aliases
alias push='eval "$(ssh-agent -s)"; ssh-add ~/.ssh/github; git push'
alias pull='eval "$(ssh-agent -s)"; ssh-add ~/.ssh/github; git fetch origin; git merge origin/main'
gitpush() {
  pull
  git add .
  git commit -m "$*"
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

# Prevent typing password too often
alias sudo="sudo -v; sudo "

# Recursively delete `.DS_Store` files
alias cleanup="find . -name '*.DS_Store' -type f -ls -delete"

# archive extractor - usage: ext <file>
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
