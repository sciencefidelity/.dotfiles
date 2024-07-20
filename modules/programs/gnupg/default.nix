{ config, pkgs, ... }:

let
  platform = config.platform;
in
{
  home = {
    packages = [
      pkgs.gnupg
    ] ++ (if platform == "darwin" then [ pkgs.pinentry_mac ] else if platform == "linux" then [ pkgs.pinentry-curses ] else [ ]);
  };

  programs.gpg = {
    enable = true;
  };

  services = {
    gpg-agent = {
      enable = true;
      enableSshSupport = true;
      enableZshIntegration = true;
      pinentryPackage = pkgs.pinentry-curses;
    };
  };
}
