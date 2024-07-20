{ pkgs, ... }:

{
  programs = {
    waybar = {
      enable = true;
      settings = {
        main = {
          layer = "top";
          position = "top";
          margin-top = 5;
          margin-bottom = 0;
          height = 15;

          output = [
            "eDP-1"
            "HDMI-A-1"
          ];
          modules-left = [ "hyprland/workspaces" "hyprland/window" ];
          modules-center = [ "custom/hello-from-waybar" ];
          modules-right = [ "group/hardware" "clock" ];

          "group/hardware" = {
            orientation = "horizontal";
            modules = [ "disk" "cpu" "memory" ];
          };

          "custom/hello-from-waybar" = {
            format = "hello {}";
            max-length = 40;
            interval = "once";
            exec = pkgs.writeShellScript "hello-from-waybar" ''
              echo "from within waybar"
            '';
          };
        };
      };

      style = /*css*/ ''
        * {
          border: none;
          border-radius: 0;
          font-family: 'Fira Code';
        }
        window#waybar {
          font-size: 10px;
          padding: 0 5px;
          background: transparent;
          color: #fff;
        }
        #workspaces,
        #window,
        #custom-hello-from-waybar,
        #hardware,
        #clock {
          padding: 0 10px;
          border-radius: 5px;
          background: rgba(0, 0, 0, 0.3);
          color: #ffffff;
          margin-right: 5px;
        }
        #workspaces {
          margin-left: 5px;
        }
        #disk,
        #cpu,
        #memory {
          padding: 0 5px;
        }
      '';
      systemd = {
        enable = true;
      };
    };
  };
}
