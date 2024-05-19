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
      openssl
      p7zip
      pkg-config
      prettierd
      ripgrep
      unzip
      vscode-langservers-extracted
    ] ++ (if platform == "darwin" then [ ]
    else if platform == "linux" then [ pkgs.lemonade pkgs.unrar-free pkgs.xclip pkgs.xsel ]
    else [ ]);
  };
}
