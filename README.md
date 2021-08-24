# dotfiles

### Emacs

[Dracula Theme](https://github.com/dracula/emacs)

```shell
mkdir -pv -- ~/.emacs.d/themes
wget https://raw.githubusercontent.com/dracula/emacs/master/dracula-theme.el\
 ~/.emacs.d/themes/dracula-theme.el
```

### Neovim

[Packer](https://github.com/wbthomason/packer.nvim)

```shell
git clone https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

### Tmux

[Tmux Plugin Manager](https://github.com/tmux-plugins/tpm)

```shell
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

### Zsh

[Spaceship Prompt](https://github.com/spaceship-prompt/spaceship-prompt)

```shell
git clone https://github.com/spaceship-prompt/spaceship-prompt.git\
 ~/dotfiles/zsh/spaceship-prompt --depth=1
mkdir .zfunctions
ln -sf "$PWD/dotfiles/zsh/spaceship-prompt/spaceship.zsh"\
 "${ZDOTDIR:-$HOME}/.zfunctions/prompt_spaceship_setup"
```

[zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)

```shell
git clone https://github.com/zsh-users/zsh-autosuggestions\
 ~/dotfiles/zsh/zsh-autosuggestions
```

[zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)

```shell
git clone https://github.com/zsh-users/zsh-syntax-highlighting\
 ~/dotfiles/zsh/zsh-syntax-highlighting
```
