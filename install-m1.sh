#! bin/zsh

echo "installing Homebrew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/matt/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

echo "installing Nix"
sh <(curl -L https://nixos.org/nix/install) --daemon

# TODO: eval Nix

echo "installing nix-darwin"
nix-build https://github.com/LnL7/nix-darwin/archive/master.tar.gz -A installer
./result/bin/darwin-installer

echo "installing home-manager"
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update

# TODO: eval nix-darwin

echo "downloading dotfiles"
mkdir ~/Developer
cd Developer
git clone https://github.com/sciencefidelity/dotfiles
cd ..

# TODO: fix symlinking
echo "preparing nix-darwin build"
rm ~/.nixpkgs/darwin-configuration.nix
sudo mv /ect/nix/nix.conf /etc/nix/nix.conf.bak
sudo mv /etc/shells /etc/shells.bak

echo "symlinking dotfiles"
ln -s ~/Developer/dotfiles/nixpkgs/darwin-configuration-m1.nix ~/.nixpkgs/darwin-configuration.nix
ln -s ~/Developer/dotfiles/.terminfo ~/.terminfo
ln -s ~/Library/Mobile\ Documents/com~apple~CloudDocs/Developer/ssh ~/.ssh
mkdir ~/.nvm

echo "copying system files"
cp ~/Library/Mobile\ Documents/com~apple~CloudDocs/System/Desktop/* ~/Pictures/
sudo cp ~/Library/Mobile\ Documents/com~apple~CloudDocs/System/User/* /Library/User\ Pictures/Fun
cp /Users/matt/Library/Mobile\ Documents/com~apple~CloudDocs/System/MonoLisa/* /Users/matt/Library/Fonts/

# TODO: find a way to open cloud files from terminal
open /Users/matt/Library/Mobile\ Documents/com~apple~CloudDocs/System/Terminal/Dracula.terminal
