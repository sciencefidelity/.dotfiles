# synchronise dotfiles
pull_dotfiles() {
  echo 'Updating dotfiles'
  cp ~/dotfiles/mac/.zshrc ~/
  # cp ~/dotfiles/mac/.tmux.conf ~/
  # cp ~/dotfiles/mac/emacs.d/init.el ~/.emacs.d/
  cp ~/dotfiles/mac/config/aliasrc.sh ~/.config/
  cp -R ~/dotfiles/mac/config/nvim ~/.config/
  cp -R ~/dotfiles/mac/config/kitty/kitty.conf ~/.config/kitty
  . ~/.zshrc
}
push_dotfiles() {
  cp ~/.zshrc ~/dotfiles/mac/
  cp ~/.bash_profile ~/dotfiles/mac/
  cp ~/.dir_colors ~/dotfiles/mac/
  # cp ~/.tmux.conf ~/dotfiles/mac/
  # cp ~/.emacs.d/init.el ~/dotfiles/mac/emacs.d
  cp ~/.config/aliasrc.sh ~/dotfiles/mac/config
  cp -R ~/.config/nvim ~/dotfiles/mac/config
  cp -R ~/.config/kitty/kitty.conf ~/dotfiles/mac/config/kitty/
}
alias pd='pull_dotfiles'

# https://the.exa.website/docs/command-line-options
alias ls='exa -F --group-directories-first'
alias l='exa -aF --group-directories-first'
alias la='exa -laF --group-directories-first --git --git-ignore'
alias ll='exa -lF --group-directories-first --git --git-ignore'
alias lt='exa -T --git-ignore'
alias lr='exa -R --git-ignore'

alias ..='cd ..'
alias mkdir='mkdir -p'

# for more human readable results
alias df='df -kTh'
alias free='free -h'

# Always use Neovim
alias vi='nvim'
alias vim='nvim'

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
