{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      fd
      lemonade
      lf
      neofetch
      # nixd
      nixpkgs-fmt
      p7zip
      prettierd
      ripgrep
      unrar-free
      unzip
      xclip
      xsel
    ];
  };

  programs.home-manager.enable = true;
}
