# dotfiles

### [Bat](https://github.com/sharkdp/bat)

[https://github.com/dracula/sublime](https://github.com/dracula/sublime)

```shell
mkdir -p "$(bat --config-dir)/themes"
cd "$(bat --config-dir)/themes"
git clone https://github.com/dracula/sublime
bat cache --build
```

### Emacs

First time running emacs do `M-x package-refresh-contents`

### Neovim

[Packer](https://github.com/wbthomason/packer.nvim)

```shell
git clone https://github.com/wbthomason/packer.nvim \
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

### Zsh

[Spaceship Prompt](https://github.com/spaceship-prompt/spaceship-prompt)

```shell
git clone https://github.com/spaceship-prompt/spaceship-prompt.git \
 ~/dotfiles/zsh/spaceship-prompt --depth=1
mkdir .zfunctions
ln -sf "$PWD/dotfiles/zsh/spaceship-prompt/spaceship.zsh" \
 "${ZDOTDIR:-$HOME}/.zfunctions/prompt_spaceship_setup"
```

[zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)

```shell
git clone https://github.com/zsh-users/zsh-autosuggestions \
 ~/dotfiles/zsh/zsh-autosuggestions
```

[zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)

```shell
git clone https://github.com/zsh-users/zsh-syntax-highlighting \
 ~/dotfiles/zsh/zsh-syntax-highlighting
```

### Homebrew

Setting up on a new Mac.

```shell
xcode-select --install
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update
brew install mas
```

### Truecolor Support

#### Kitty

[Emacs colors info](https://www.gnu.org/software/emacs/manual/html_node/efaq/Colors-on-a-TTY.html)

Create a file `terminfo-custom.src` in the home directory:

```shell
xterm-emacs|xterm with 24-bit direct color mode for Emacs,
use=xterm-256color,
setb24=\E[48\:2\:\:%p1%{65536}%/%d\:%p1%{256}%/%{255}%&\%d\:%p1%{255}%&%dm,
setf24=\E[38\:2\:\:%p1%{65536}%/%d\:%p1%{256}%/%{255}%&\%d\:%p1%{255}%&%dm,
```

```shell
tic -x -o ~/.terminfo terminfo-custom.src
```

Run Emacs with the command `TERM=xterm-emacs emacs -nw`

## Notes

#### Colors not working in macOS

- emacs in Nova
- bat run in Nova
- emacs in tmux in Kitty
- emacs in tmux in Nova
- bat run in tmux in Nova
- emacs on Raspberry Pi in tmux on Kitty
