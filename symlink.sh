echo "symlinking dotfiles"
ln -s ~/Developer/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/config/zsh ~/.config/zsh
ln -s ~/Developer/dotfiles/config/bat ~/.config/bat
ln -s ~/Developer/dotfiles/config/emacs.d/init.el ~/.emacs.d/init.el
ln -s ~/Developer/dotfiles/config/nvim/init.lua ~/.config/nvim/init.lua
ln -s ~/Developer/dotfiles/config/starship/starship.toml ~/.config/starship/starship.toml
ln -s ~/Developer/dotfiles/.terminfo ~/.terminfo
ln -s ~/Developer/dotfiles/config/kitty/kitty.conf ~/.config/kitty/kitty.conf
ln -s ~/Developer/dotfiles/config/hammerspoon/init.lua ~/.hammerspoon/init.lua
ln -s ~/Developer/dotfiles/.gitconfig ~/.gitconfig
mkdir ~/.nvm

echo "copying system files"
ln -s /Users/matt/Library/Mobile\ Documents/com~apple~CloudDocs/Developer/ssh ~/.ssh
cp ~/Developer/dotfiles/pictures/desktop/* ~/Pictures/
sudo cp ~/Developer/dotfiles/pictures/user/* /Library/User\ Pictures/Fun
cp /Users/matt/Library/Mobile\ Documents/com~apple~CloudDocs/System/MonoLisa/* /Users/matt/Library/Fonts/
open /Users/matt/Library/Mobile\ Documents/com~apple~CloudDocs/System/Terminal/Dracula.terminal
