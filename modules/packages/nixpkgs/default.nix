{ config, pkgs, ... }:

let
  platform = config.platform;
in
{
  home = {
    packages = with pkgs; [
      bc
      fd
      jq
      lf
      neofetch
      openssl
      p7zip
      pcalc
      pkg-config
      prettierd
      ripgrep
      unzip
      vscode-langservers-extracted
    ] ++ (if platform == "darwin" then [ ]
    else if platform == "linux" then [ pkgs.lemonade pkgs.tcpdump pkgs.unrar-free pkgs.xclip pkgs.xsel ]
    else [ ]);
  };
}
