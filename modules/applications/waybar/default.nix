{ inputs, pkgs, ... }:

{
  programs = {
    waybar = {
      enable = true;
      settings = {
        main = {
          layer = "top";
          position = "top";
          # margin-top = 5;
          # margin-bottom = 0;
          # height = 15;

          modules-left = [ "wlr/workspaces" ];
          modules-center = [ "hyprland/window" ];
          modules-right = [
            "pulseaudio"
            "backlight"
            "battery"
            "clock"
            "tray"
            "custom/lock"
            "custom/power"
          ];
          "wlr/workspaces" = {
            disable-scroll = true;
            sort-by-name = true;
            format = " {icon} ";
            format-icons = {
              default = "";
            };
          };
          tray = {
            icon-size = 21;
            spacing = 20;
          };
          "custom/music" = {
            format = "  {}";
            escape = true;
            interval = 5;
            tooltip = false;
            exec = "playerctl metadata --format='{{ title }}'";
            on-click = "playerctl play-pause";
            max-length = 50;
          };
          clock = {
            timezone = "Europe/London";
            tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
            format-alt = " {:%d/%m/%Y}";
            format = " {:%H:%M}";
          };
          backlight = {
            device = "intel_backlight";
            format = "{icon}";
            format-icons = [ "" "" "" "" "" "" "" "" "" ];
          };
          battery = {
            states = {
              warning = 30;
              critical = 15;
            };
            format = "{icon}";
            format-charging = "";
            format-plugged = "";
            format-alt = "{icon}";
            format-icons = [ "" "" "" "" "" "" "" "" "" "" "" "" ];
          };
          pulseaudio = {
            # "scroll-step": 1, #  %, can be a float
            format = "{icon} {volume}%";
            format-muted = "";
            format-icons = {
              default = [ "" "" " " ];
            };
            on-click = "pavucontrol";
          };
          "custom/lock" = {
            tooltip = false;
            on-click = "sh -c '(sleep 0.5s; swaylock --grace 0)' & disown";
            format = "";
          };
          "custom/power" = {
            tooltip = false;
            on-click = "wlogout &";
            format = "襤";
          };
        };
      };

      style = /*css*/ ''
        @import "${inputs.waybar-catppuccin}/themes/mocha.css";

        * {
          font-family: "MonoLisa Script", "Fira Code", "Symbols Nerd Font Mono";
          font-size: 17px;
          min-height: 0;
        }
        #waybar {
          background: transparent;
          color: @text;
          margin: 5px 5px;
        }
        #workspaces {
          border-radius: 1rem;
          margin: 5px;
          background-color: @surface0;
          margin-left: 1rem;
        }
        #workspaces button {
          color: @lavender;
          border-radius: 1rem;
          padding: 0.4rem;
        }
        #workspaces button.active {
          color: @sky;
          border-radius: 1rem;
        }
        #workspaces button:hover {
          color: @sapphire;
          border-radius: 1rem;
        }
        #custom-music,
        #tray,
        #backlight,
        #clock,
        #battery,
        #pulseaudio,
        #custom-lock,
        #custom-power {
          background-color: @surface0;
          padding: 0.5rem 1rem;
          margin: 5px 0;
        }
        #clock {
          color: @blue;
          border-radius: 0px 1rem 1rem 0px;
          margin-right: 1rem;
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
        #backlight {
          color: @yellow;
        }
        #backlight, #battery {
            border-radius: 0;
        }
        #pulseaudio {
          color: @maroon;
          border-radius: 1rem 0px 0px 1rem;
          margin-left: 1rem;
        }
        #custom-music {
          color: @mauve;
          border-radius: 1rem;
        }
        #custom-lock {
            border-radius: 1rem 0px 0px 1rem;
            color: @lavender;
        }
        #custom-power {
            margin-right: 1rem;
            border-radius: 0px 1rem 1rem 0px;
            color: @red;
        }
        #tray {
          margin-right: 1rem;
          border-radius: 1rem;
        }
      '';
      systemd = {
        enable = true;
      };
    };
  };
}
