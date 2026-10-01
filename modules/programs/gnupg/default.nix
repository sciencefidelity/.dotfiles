{ lib, pkgs, ... }:

{
  home = with pkgs; {
    packages = [
      gnupg
    ] ++ (if stdenv.hostPlatform.isDarwin then [
      pinentry_mac
    ] else if stdenv.hostPlatform.isLinux then [
      pinentry-curses
    ] else [ ]);
  };

  programs.gpg = {
    enable = true;
  };

  services = lib.mkIf pkgs.stdenv.hostPlatform.isLinux {
    gpg-agent = {
      enable = true;
      enableSshSupport = true;
      enableZshIntegration = true;
      pinentry.package = pkgs.pinentry-curses;
    };
  };
}
