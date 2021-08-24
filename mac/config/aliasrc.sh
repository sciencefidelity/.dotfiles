# synchronise dotfiles
pull_dotfiles() {
  echo 'Updating dotfiles'
  cp ~/dotfiles/mac/.zshrc ~/
  cp ~/dotfiles/mac/.bash_profile ~/
  cp ~/dotfiles/mac/.dir_colors ~/
  # cp ~/dotfiles/mac/.tmux.conf ~/
  # cp ~/dotfiles/mac/emacs.d/init.el ~/.emacs.d/
  cp ~/dotfiles/mac/config/aliasrc.sh ~/.config/
  cp -R ~/dotfiles/mac/config/nvim ~/.config/
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
}
alias pd='pull_dotfiles'

# tell grep to highlight matches
export GREP_OPTIONS='--color=auto'

alias ls='gls --color=auto'
alias l='ls -f  --color=auto'
alias la='ls -Alh --color=auto --human-readable'
alias lx='ls -lXB --color=auto'
alias ll='ls -lv --color=auto --human-readable'
alias lr='ll -R --color=auto'

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
