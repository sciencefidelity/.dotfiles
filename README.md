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

### Utils

[Temperature util](https://www.raspberrypi.org/forums/viewtopic.php?t=252115) (for Raspberry Pi)

```
gcc ~/dotfiles/utils/temp.c -o temp
sudo mv ./temp /usr/local/bin/
```

### Truecolor Support

#### Kitty

[Emacs colors info](https://www.gnu.org/software/emacs/manual/html_node/efaq/Colors-on-a-TTY.html)

Create a file `terminfo-custom.src` in the home directory:

```
xterm-emacs|xterm with 24-bit direct color mode for Emacs,
use=xterm-256color,
setb24=\E[48\:2\:\:%p1%{65536}%/%d\:%p1%{256}%/%{255}%&\
   %d\:%p1%{255}%&%dm,
setf24=\E[38\:2\:\:%p1%{65536}%/%d\:%p1%{256}%/%{255}%&\
   %d\:%p1%{255}%&%dm,
```

```
tic -x -o ~/.terminfo terminfo-custom.src
```

Run Emacs with the command `TERM=xterm-emacs emacs -nw`

