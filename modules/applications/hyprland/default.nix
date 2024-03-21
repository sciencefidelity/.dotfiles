{ config, inputs, ... }:

let
  terminal = config.terminal;
in
{
  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = ''
      ${builtins.readFile "${inputs.catppuccin-hyprland}/themes/mocha.conf"}

      monitor=,preferred,auto,auto

      $terminal = ${terminal}
      $fileManager = dolphin
      $menu = wofi --show drun

      env = XCURSOR_SIZE,48
      env = QT_QPA_PLATFORMTHEME,qt5ct # change to qt6ct if you have that

      input {
          kb_layout = gb
          kb_options = caps:swapescape
          follow_mouse = 1
          touchpad {
              natural_scroll = yes
          }
      }

      general {
          gaps_in = 5
          gaps_out = 5
          border_size = 2
          col.active_border = 0xFF$blueAlpha
          col.inactive_border = 0x66$overlay0Alpha
          layout = dwindle
          allow_tearing = false
      }

      decoration {
          rounding = 5
          blur {
              enabled = false
          }
          drop_shadow = no
      }

      animations {
          enabled = no
      }

      dwindle {
          pseudotile = yes
          preserve_split = yes
      }

      master {
          new_is_master = true
      }

      gestures {
          workspace_swipe = off
      }

      misc {
          force_default_wallpaper = 0
      }

      device {
          name = epic-mouse-v1
          sensitivity = -0.5
      }

      $mainMod = SUPER

      bind = $mainMod, Q, exec, $terminal
      bind = $mainMod, C, killactive,
      bind = $mainMod, M, exit,
      bind = $mainMod, E, exec, $fileManager
      bind = $mainMod, V, togglefloating,
      bind = $mainMod, R, exec, $menu
      bind = $mainMod, P, pseudo, # dwindle
      bind = $mainMod, F, togglesplit, # dwindle

      # Move focus with mainMod + arrow keys
      bind = $mainMod, H, movefocus, l
      bind = $mainMod, L, movefocus, r
      bind = $mainMod, K, movefocus, u
      bind = $mainMod, J, movefocus, d

      # Switch workspaces with mainMod + [0-9]
      bind = $mainMod, 1, workspace, 1
      bind = $mainMod, 2, workspace, 2
      bind = $mainMod, 3, workspace, 3
      bind = $mainMod, 4, workspace, 4
      bind = $mainMod, 5, workspace, 5
      bind = $mainMod, 6, workspace, 6
      bind = $mainMod, 7, workspace, 7
      bind = $mainMod, 8, workspace, 8
      bind = $mainMod, 9, workspace, 9
      bind = $mainMod, 0, workspace, 10

      # Move active window to a workspace with mainMod + SHIFT + [0-9]
      bind = $mainMod SHIFT, 1, movetoworkspace, 1
      bind = $mainMod SHIFT, 2, movetoworkspace, 2
      bind = $mainMod SHIFT, 3, movetoworkspace, 3
      bind = $mainMod SHIFT, 4, movetoworkspace, 4
      bind = $mainMod SHIFT, 5, movetoworkspace, 5
      bind = $mainMod SHIFT, 6, movetoworkspace, 6
      bind = $mainMod SHIFT, 7, movetoworkspace, 7
      bind = $mainMod SHIFT, 8, movetoworkspace, 8
      bind = $mainMod SHIFT, 9, movetoworkspace, 9
      bind = $mainMod SHIFT, 0, movetoworkspace, 10

      # Example special workspace (scratchpad)
      bind = $mainMod, S, togglespecialworkspace, magic
      bind = $mainMod SHIFT, S, movetoworkspace, special:magic

      # Scroll through existing workspaces with mainMod + scroll
      bind = $mainMod, mouse_down, workspace, e+1
      bind = $mainMod, mouse_up, workspace, e-1

      # Move/resize windows with mainMod + LMB/RMB and dragging
      bindm = $mainMod, mouse:272, movewindow
      bindm = $mainMod, mouse:273, resizewindow
    '';
    systemd.extraCommands = [
      "swww init"
    ];
  };
}
