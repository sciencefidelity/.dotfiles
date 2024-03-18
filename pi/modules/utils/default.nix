{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      # nixd
      nixpkgs-fmt
      fd
      lemonade
      lf
      neofetch
      p7zip
      ripgrep
      unrar-free
      unzip
      xclip
      xsel
    ];
  };

  programs.home-manager.enable = true;
}
