# synchronise dotfiles
pull_dotfiles() {
  echo 'Updating dotfiles'
  cp ~/dotfiles/linux/.zshrc ~/
  cp ~/dotfiles/linux/.bash_profile ~/
  cp ~/dotfiles/linux/.dir_colors ~/
  cp ~/dotfiles/linux/.tmux.conf ~/
  cp ~/dotfiles/linux/emacs.d/init.el ~/.emacs.d/
  cp ~/dotfiles/linux/config/aliasrc.sh ~/.config/
  cp -R ~/dotfiles/linux/config/nvim ~/.config/
  . ~/.zshrc
}
push_dotfiles() {
  cp ~/.zshrc ~/dotfiles/linux/
  cp ~/.bash_profile ~/dotfiles/linux/
  cp ~/.dir_colors ~/dotfiles/linux/
  cp ~/.tmux.conf ~/dotfiles/linux/
  cp ~/.emacs.d/init.el ~/dotfiles/linux/emacs.d
  cp -R ~/.config/aliasrc.sh ~/dotfiles/linux/config
  cp -R ~/.config/nvim ~/dotfiles/linux/config
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
