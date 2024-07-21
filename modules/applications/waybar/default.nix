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
            "memory"
            "cpu"
            "temperature"
            "battery"
            "backlight"
            "clock"
          ];
          "hyprland/workspaces" = {
            disable-scroll = true;
            sort-by-name = true;
          };
          clock = {
            timezone = "Europe/London";
            format = "{:%d/%m/%Y %H:%M}";
          };
          backlight = {
            format = "{percent}%";
          };
          battery = {
            states = {
              warning = 30;
              critical = 15;
            };
            format = "{capacity}%";
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
        #memory,
        #cpu,
        #temperature,
        #battery,
        #backlight,
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
          color: @blue;
        }
        #workspaces button:hover {
          background: transparent;
          border: none;
          color: @mauve;
        }
        #memory {
          color: @pink;
        }
        #cpu {
          color: @sky;
        }
        #temperature {
          color: @teal;
        }
        #backlight {
          color: @yellow;
        }
        #battery {
          color: @green;
        }
        #battery.charging {
          color: @green;
        }
        #battery.warning:not(.charging) {
          color: @red;
        }
        #clock {
          color: @blue;
        }
      '';
      systemd = {
        enable = true;
      };
    };
  };
}
