{ config, pkgs, ... }:

let
  bl = pkgs.writeShellScriptBin "bl" /*bash*/ ''
    if [ "$#" -ne 1 ]; then
      echo "Usage: $0 <brightness_percentage>"
      exit 1
    fi
    if ! [[ "$1" =~ ^[0-9]+$ ]] || [ "$1" -lt 0 ] || [ "$1" -gt 100 ]; then
      echo "Error: Argument must be a number between 0 and 100"
      exit 1
    fi
    MAX_BRIGHTNESS=${toString config.maxBrightness}
    BRIGHTNESS=$(( $1 * MAX_BRIGHTNESS / 100 ))
    echo $BRIGHTNESS | sudo tee /sys/class/backlight/intel_backlight/brightness > /dev/null
    echo "Brightness set to $1% ($BRIGHTNESS)"
  '';
in
{
  environment.systemPackages = [ bl ];
}
