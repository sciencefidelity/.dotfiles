# dotfiles

### Plugins for zsh
[Spaceship Prompt](https://github.com/spaceship-prompt/spaceship-prompt/)

```shell
git clone https://github.com/spaceship-prompt/spaceship-prompt.git --depth=1
mkdir .zfunctions
ln -sf "~/dotfiles/zsh/spaceship-prompt/spaceship.zsh" "${ZDOTDIR:-$HOME}/.zfunctions/prompt_spaceship_setup"
```

[zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)

```
git clone https://github.com/zsh-users/zsh-autosuggestions ~/dotfiles/zsh/zsh-autosuggestions
```

[zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)

```
git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/dotfiles/zsh/zsh-syntax-highlighting
```
