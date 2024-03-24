{ config, pkgs, ... }:

let
  platform = config.platform;
in
{
  home = {
    packages = with pkgs; [
      fd
      lf
      neofetch
      p7zip
      prettierd
      ripgrep
      unzip
    ] ++ (if platform == "darwin" then with pkgs; [ ]
    else if platform == "linux" then with pkgs; [ lemonade unrar-free xclip xsel ]
    else [ ]);
  };

  programs.home-manager.enable = true;
}
