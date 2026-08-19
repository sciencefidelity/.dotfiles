{ pkgs, ... }:

{
  environment = {
    systemPackages = with pkgs; [
      openobserve
    ];
  };
}
