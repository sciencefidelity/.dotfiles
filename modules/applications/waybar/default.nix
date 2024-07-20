{ pkgs, ... }:

{
  programs = {
    waybar = {
      enable = true;
      settings = [
        {
          mainBar = {
            layer = "top";
            position = "top";
            margin-top = 14;
            margin-bottom = 0;
            height = 30;

            output = [
              "eDP-1"
              "HDMI-A-1"
            ];
            modules-left = [ "hyprland/workspaces" "hyprland/window" ];
            modules-center = [ "custom/hello-from-waybar" ];
            modules-right = [ "bluetooth" "network" "clock" ];

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
        }
      ];
      style = /*css*/ ''
        * {
          border: none;
          border-radius: 0;
          font-family: Source Code Pro;
        }
        window#waybar {
          background: #16191C;
          color: #AAB2BF;
        }
        #workspaces button {
          padding: 0 5px;
        }
      '';
      systemd = {
        enable = true;
      };
    };
  };
}
