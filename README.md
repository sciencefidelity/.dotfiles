# dotfiles

### Plugins for zsh
[Spaceship Prompt](https://github.com/spaceship-prompt/spaceship-prompt)

```shell
git clone https://github.com/spaceship-prompt/spaceship-prompt.git ~/dotfiles/zsh/spaceship-prompt --depth=1
mkdir .zfunctions
ln -sf "$PWD/dotfiles/zsh/spaceship-prompt/spaceship.zsh" "${ZDOTDIR:-$HOME}/.zfunctions/prompt_spaceship_setup"
```

[zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)

```shell
git clone https://github.com/zsh-users/zsh-autosuggestions ~/dotfiles/zsh/zsh-autosuggestions
```

[zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)

```shell
git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/dotfiles/zsh/zsh-syntax-highlighting
```

### Neovim

[Packer](https://github.com/wbthomason/packer.nvim)

```shell
git clone https://github.com/wbthomason/packer.nvim\ ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```
