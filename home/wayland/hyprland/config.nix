{pkgs, ...}: {
  xdg.configFile."hypr/hyprpaper.conf".text = ''
    preload = ~/Pictures/wallpapers/city.png
    wallpaper = HDMI-A-1,~/Pictures/wallpapers/city.png
    wallpaper = DP-1,~/Pictures/wallpapers/city.png
    wallpaper = DP-2,~/Pictures/wallpapers/city.png
    wallpaper = DP-3,~/Pictures/wallpapers/city.png
  '';

  wayland.windowManager.hyprland.extraConfig = ''

    monitor = HDMI-A-1,1920x1080@60, 3640x560, auto, transform, 3 #right
    monitor = DP-1,1920x1080@60, 0x560, auto, transform, 1 #left
    monitor = DP-2,2560x1440@144, 1080x1080, auto #middle
    monitor = DP-3,1920x1080@144, 1400x0, auto #top

    input {
      kb_layout = us

      follow_mouse = 1

      sensitivity = -0.5
      force_no_accel = true
    }

    general {
      gaps_in = 10
      gaps_out = 20
      border_size = 4
      col.active_border = rgb(f7768e) rgb(2ac3de)
      col.inactive_border = rgb(6c7086)

      layout = dwindle
    }

    decoration {
      rounding = 12
      blur {
        enabled = true
        size = 6
        passes = 3
        new_optimizations = true
      }
      inactive_opacity = 1.0
      active_opacity = 1.0
      fullscreen_opacity = 1.0

      drop_shadow = yes
      shadow_range = 60
      shadow_offset = 0 5
      shadow_render_power = 4
      col.shadow = rgba(00000099)
    }

    animations {
      enabled = yes

      bezier = fastBezier, 0.05, 1.1, 0.2, 1.0
      bezier = linear, 0.0, 0.0, 1.0, 1.0
      bezier = liner, 1, 1, 1, 1

      animation = windows, 1, 7, fastBezier, slide
      animation = windowsOut, 1, 7, fastBezier, slide
      animation = border, 1, 10, fastBezier
      animation = fade, 1, 7, fastBezier
      animation = workspaces, 1, 6, fastBezier
      animation = border, 1, 1, liner
      animation = borderangle, 1, 40, liner, loop
      animation = borderangle, 1, 100, linear, loop
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

    device:epic mouse V1 {
      sensitivity = -0.5
    }

    misc {
      disable_hyprland_logo = true
    }

    exec-once = hyprpaper
    exec-once = dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
    exec-once = ${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1

    # swayidle / lock
    exec-once = ~/.local/bin/lock

    #windowrules
    windowrulev2 = noshadow, floating:0
    windowrulev2 = float, title:^(Volume Control)$
    windowrulev2 = float, title:^(Picture in picture)$
    windowrulev2 = float, title:^(Steam)$
    windowrulev2 = float, title:^(Friends List)$
    windowrulev2 = float, title:^(Cryptomator)$
    windowrulev2 = float, title:^(RuneLite)$
    windowrulev2 = float, title:^(Lutris)$
    windowrulev2 = float, title:^(satty)$
    windowrulev2 = move 850 360, title:^(RuneLite)$
    windowrulev2 = size 830 600, title:^(RuneLite)$
    windowrulev2 = fullscreen, title:^(cs2)$

    #binds
    $mainMod = SUPER

    bind = $mainMod, Return, exec, wezterm
    bind = $mainMod, Q, killactive,
    bind = $mainMod, V, togglefloating,
    bind = $mainMod, R, exec, anyrun
    bind = $mainMod, P, pseudo, # dwindle
    bind = $mainMod, J, togglesplit, # dwindle
    bind =, Print, exec, grim -g "$(slurp)" - | satty -f - --fullscreen --output-filename ~/Pictures/screenshots/$(date '+%Y%m%d-%H:%M:%S').png
    bind = $mainMod, left, movefocus, l
    bind = $mainMod, right, movefocus, r
    bind = $mainMod, up, movefocus, u
    bind = $mainMod, down, movefocus, d

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

    bind = $mainMod, mouse_down, workspace, e+1
    bind = $mainMod, mouse_up, workspace, e-1

    bindm = $mainMod, mouse:272, movewindow
    bindm = $mainMod, mouse:273, resizewindow

  '';
}
