#! bin/zsh

echo "installing Nix"
curl -L https://nixos.org/nix/install | sh

echo "installing Homebrew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

exec zsh --login

echo "downloading dotfiles"
mkdir ~/Developer
cd Developer
git clone https://github.com/sciencefidelity/dotfiles
cd ..

echo "installing nix-darwin"
nix-build https://github.com/LnL7/nix-darwin/archive/master.tar.gz -A installer
./result/bin/darwin-installer

echo "add home-manager module"
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update

exec zsh --login

echo "creating simlinks"
rm ~/.nixpkgs/darwin-configuration.nix
sudo mv /ect/nix/nix.conf /etc/nix/nix.conf.bak
sudo mv /etc/shells /etc/shells.bak
ln -s ~/Developer/dotfiles/.terminfo ~/.terminfo
ln -s ~/Developer/dotfiles/nixpkgs/darwin-configuration.nix ~/.nixpkgs/darwin-configuration.nix
ln -s /Users/matt/Library/Mobile\ Documents/com~apple~CloudDocs/Developer/ssh ~/.ssh
cp ~/Developer/dotfiles/pictures/desktop/* ~/Pictures/
sudo cp ~/Developer/dotfiles/pictures/user/* /Library/User\ Pictures/Fun

echo "building nix-darwin"
darwin-rebuild switch

echo "restarting"
sudo shutdown -r now
