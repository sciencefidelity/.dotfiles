{ pkgs, ... }:

{
  environment = {
    systemPackages = with pkgs; [
      swww
      wofi
    ];

    variables = {
      NIXOS_OZONE_WL = "1";
    };
  };

  programs = {
    hyprland.enable = true;

    zsh = {
      enable = true;
      shellInit = /*bash*/ ''
        eval "$(ssh-agent -s)" > /dev/null
        ssh-add ~/.ssh/github 2> /dev/null
        export GPG_TTY=$(tty)
      '';
    };
  };
}

