{ config, pkgs, ... }:

let
  platform = config.platform;
in
{
  home = {
    packages = with pkgs; [
      gnupg
    ] ++ (if platform == "darwin" then [ pkgs.pinentry_mac ] else [ pkgs.pinentry-curses ]);
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
