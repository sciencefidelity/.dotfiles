{ config, inputs, lib, pkgs, ... }:

let
  terminal = config.terminal.app;
  borderSize = config.hypr.borderSize or 2;
  cursorSize = config.hypr.cursorSize or 96;
  cursorTheme = config.hypr.cursorTheme or "catpuccin-cursors";
  gapsIn = config.hypr.gapsIn or 5;
  gapsOut = config.hypr.gapsOut or 10;
  rounding = config.hypr.rounding or 10;
  mod = "SUPER";
  notes = "OBSIDIAN_USE_WAYLAND=1 obsidian --ozone-platform-hint=auto";
  browser = "firefox";
  launcher = "wofi --conf ${inputs.catppuccin-wofi}/config/config --style ${inputs.catppuccin-wofi}/src/mocha/style.css";
  host = config.hostname;
  # exit = pkgs.writeShellScriptBin "exit-hyprland" /*bash*/ ''
  #   HYPRCMDS=$(hyprctl -j clients | jq -j '.[] | "dispatch closewindow address:\(.address); "')
  #   hyprctl --batch "$HYPRCMDS"
  #   hyprctl dispatch exit
  # '';
in
{
  home = {
    packages = [
      pkgs.catppuccin-cursors.mochaDark
      # exit
    ];
    sessionVariables = {
      HYPRCURSOR_THEME = cursorTheme;
      HYPRCURSOR_SIZE = cursorSize;
      XDG_CURRENT_DESKTOP = "Hyprland";
      XDG_SESSION_TYPE = "wayland";
      XDG_SESSION_DESKTOP = "Hyprland";
      WLR_NO_HARDWARE_CURSORS = 1;
    };
  };

  wayland.windowManager.hyprland = {
    enable = true;
    systemd = {
      enable = true;
    };
    settings = {
      source = "${inputs.catppuccin-hyprland}/themes/mocha.conf";
      monitor =
        if host == "io" then [
          "DP-5,preferred,0x0,1"
          "DP-6,preferred,3840x0,1.2"
          "HDMI-A-7,preferred,auto,1,mirror,DP-6"
        ] else if host == "rhea" then [
          "Apple Computer Inc Color LCD,2560x1600@59.97200,0x0,0.5"
        ] else [
          ",preferred,auto,auto"
        ];
      exec-once = [
        "swww-daemon"
        "hyprctl setcursor ${cursorTheme} ${toString cursorSize}"
        "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
      ];
      env = [
        "HYPRCURSOR_THEME,${cursorTheme}"
        "HYPRCURSOR_SIZE,${toString cursorSize}"
      ];
      general = {
        gaps_in = gapsIn;
        gaps_out = gapsOut;
        border_size = borderSize;
        "col.active_border" = "0xFF$blueAlpha";
        "col.inactive_border" = "0x66$overlay0Alpha";
        allow_tearing = false;
        layout = "dwindle";
      };
      decoration = {
        rounding = rounding;
        blur = {
          enabled = false;
        };
        # drop_shadow = false;
      };
      animations = {
        enabled = false;
      };
      dwindle = {
        pseudotile = false;
        preserve_split = true;
      };
      master = {
        new_status = "master";
      };
      misc = {
        force_default_wallpaper = 0;
        disable_hyprland_logo = true;
      };
      input = {
        kb_layout = "au";
        kb_variant = "mac,nodeadkeys";
        kb_options = "caps:ctrl_modifier";
        repeat_delay = 210;
        repeat_rate = 40;
        follow_mouse = 0;
        touchpad = lib.mkIf (host == "rhea") {
          disable_while_typing = true;
          clickfinger_behavior = true;
          "tap-to-click" = false;
        };
      };
      device = lib.mkIf (host == "rhea") {
        name = "bcm5974";
        accel_profile = "adaptive";
        natural_scroll = true;
        sensitivity = 0;
        disable_while_typing = true;
        clickfinger_behavior = true;
        tap-to-click = false;
      };
      gestures = lib.mkIf (host == "rhea") {
        workspace_swipe = true;
        workspace_swipe_create_new = true;
      };
      bind = [
        "${mod}, T, exec, ${terminal}"
        "${mod}, Q, killactive"
        "${mod}, O, exec, ${notes}"
        "${mod}, B, exec, ${browser}"
        "${mod}, V, togglefloating"
        "${mod}, Space, exec, ${launcher}"
        "${mod}, P, pseudo"
        "${mod}, R, togglesplit"
        "${mod}, F, fullscreen, 1"
        # "${mod}, F11, exec, ${exit}"
        "${mod}, X, swapwindow, u"
        "${mod}, Y, swapwindow, l"
        "${mod}, S, swapnext, l"
        "${mod}, H, movefocus, l"
        "${mod}, L, movefocus, r"
        "${mod}, K, movefocus, u"
        "${mod}, J, movefocus, d"
        "${mod}, 1, workspace, 1"
        "${mod}, 2, workspace, 2"
        "${mod}, 3, workspace, 3"
        "${mod}, 4, workspace, 4"
        "${mod}, 5, workspace, 5"
        "${mod}, 6, workspace, 6"
        "${mod}, 7, workspace, 7"
        "${mod} SHIFT, 1, movetoworkspace, 1"
        "${mod} SHIFT, 2, movetoworkspace, 2"
        "${mod} SHIFT, 3, movetoworkspace, 3"
        "${mod} SHIFT, 4, movetoworkspace, 4"
        "${mod} SHIFT, 5, movetoworkspace, 5"
        "${mod} SHIFT, 6, movetoworkspace, 6"
        "${mod} SHIFT, 7, movetoworkspace, 7"
        "${mod}, mouse_down, workspace, e+1"
        "${mod}, mouse_up, workspace, e-1"
      ];
      bindm = [
        "${mod}, mouse:272, movewindow"
        "${mod}, mouse:273, resizewindow"
      ];
    };
  };

  programs.zsh = {
    initExtra = /*bash*/ ''
      # TTY1=$(tty)
      # if [ "$TTY1" = "/dev/tty1" ]; then
      #   exec Hyprland
      # fi
    '';
  };
}
