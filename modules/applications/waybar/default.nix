{ inputs, ... }:

{
  programs = {
    waybar = {
      enable = true;
      settings = {
        main = {
          layer = "top";
          position = "top";
          margin-top = 5;
          margin-bottom = -1;
          margin-left = 5;
          margin-right = 5;

          modules-left = [ "hyprland/workspaces" ];
          modules-center = [ "hyprland/window" ];
          modules-right = [
            "backlight"
            "battery"
            "temperature"
            "disk"
            "memory"
            "cpu"
            "network"
            "clock#date"
            "clock"
          ];
          "hyprland/workspaces" = {
            disable-scroll = true;
            sort-by-name = true;
          };
          backlight = {
            format = "{percent}%";
            # format-icons = [ "" "" "" "" "" "" "" "" "" ];
          };
          battery = {
            states = {
              warning = 30;
              critical = 15;
            };
            format = "{capacity}%";
            # format-icons = [ "" "" "" "" "" ];
          };
          temperature = {
            format = "{temperatureC}°C";
          };
          disk = {
            format = "{free}";
            # format-icons = [ "󰋊" ];
          };
          memory = {
            # format = "MEMORY {}%"
            format = "{used:0.1f}G/{total:0.1f}G";
          };
          cpu = {
            format = "{usage}%";
            # format-icons = [ "󰍛" ];
          };
          network = {
            format-wifi = "N {signalStrength}%";
            # format-wifi = " {signalStrength}%";
            # format-ethernet = " {signalStrength}%";
            # format-disconnected = "󰤭";
          };
          "clock#date" = {
            format = "{:%d/%m/%Y}";
          };
          clock = {
            timezone = "Europe/London";
            format = "{:%H:%M}";
          };
        };
      };

      style = /*css*/ ''
        @import "${inputs.catppuccin-waybar}/themes/mocha.css";

        * {
          font-family: "Symbols Nerd Font Mono", "MonoLisa Script";
          font-size: 10px;
          min-height: 0;
        }
        #waybar {
          background-color: alpha(@base, 0.9);
          border: 1px solid alpha(@overlay0, 0.9);
          border-radius: 5px;
          color: @text;
        }
        #workspaces,
        #window,
        #backlight,
        #battery,
        #temperature,
        #disk,
        #memory,
        #cpu,
        #network,
        #clock-date,
        #clock {
          margin-left: 0;
          padding-left: 0;
          padding-right: 10px;
        }
        #workspaces {
          padding-right: 15px;
        }
        #workspaces button {
          background: transparent;
        }
        #workspaces button.visible,
        #workspaces button.empty {
          color: @surface0;
        }
        #workspaces button.active {
          background: transparent;
          color: @pink;
        }
        #workspaces button:hover {
          background: transparent;
          border: none;
          color: @mauve;
        }
        #battery {
          color: @red;
        }
        #battery.charging {
          color: @maroon;
        }
        #battery.warning:not(.charging) {
          color: @red;
        }
        #backlight {
          color: @peach;
        }
        #temperature {
          color: @yellow;
        }
        #disk {
          color: @green;
        }
        #memory {
          color: @teal;
        }
        #cpu {
          color: @sky;
        }
        #network {
          color: @sapphire;
        }
        #clock.date {
          color: @blue;
        }
        #clock {
          color: @lavender;
        }
      '';
      systemd = {
        enable = true;
      };
    };
  };
}
