#! bin/zsh

echo "installing Nix"
curl -L https://nixos.org/nix/install | sh

echo "installing Homebrew"
/bin/bash -c \
"$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "installing nix-darwin"
nix-build https://github.com/LnL7/nix-darwin/archive/master.tar.gz -A installer
./result/bin/darwin-installer

echo "add home-manager module"
nix-channel --add \
https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update

# TODO - can we use nix-to load git without installing it?
echo "downloading dotfiles"
nix-env -iA nixpkgs.git
mkdir ~/Developer
cd Developer
git clone https://github.com/sciencefidelity/dotfiles
cd ..
nix-env -e git

echo "creating simlinks"
ln -s ~/Developer/dotfiles/nixpkgs/darwin-configuration.nix \
~/.nixpkgs/darwin-configuration.nix

echo "building nix-darwin and home-manager"
darwin-rebuild switch
