{ pkgs, ... }:

{
  # security.rkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa = {
      enable = true;
      support32Bit = true;
    };
    pulse.enable = true;
    wireplumber = {
      enable = true;
    };
  };

  environment = {
    systemPackages = with pkgs; [
      alsa-firmware
      alsa-utils
      grim
      slurp
      xdg-desktop-portal-hyprland
    ];
  };
}
