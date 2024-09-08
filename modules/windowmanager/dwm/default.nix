{ pkgs, ... }:

{
  environment = {
    systemPackages = with pkgs; [
      catppuccin-sddm
      dmenu
      feh
    ];
  };

  services = {
    xserver = {
      enable = true;
      # displayManager.lightdm.enable = true;
      windowManager.dwm.enable = true;
    };
    displayManager.sddm = {
      enable = true;
      theme = "catppuccin-mocha";
      package = pkgs.kdePackages.sddm;
    };
  };
}

