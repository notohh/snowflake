{pkgs, ...}: {
  wayland.windowManager.hyprland = {
    settings = {
      monitor = [
        "HDMI-A-1,1920x1080@60, 3640x560, auto, transform, 3" #right
        "DP-1,1920x1080@60, 0x560, auto, transform, 1" #left
        "DP-2,2560x1440@144, 1080x1080, auto" #middle
        "DP-3,1920x1080@144, 1400x0, auto" #top
      ];
      exec-once = [
        # "ags"
        "hyprpaper"
        "chatterino"
        "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
        "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1"
        "~/.local/bin/lock"
      ];
      input = {
        kb_layout = "us";
        follow_mouse = 1;
        sensitivity = "-0.5";
        force_no_accel = true;
      };
      general = {
        gaps_in = 10;
        gaps_out = 20;
        border_size = 4;
        "col.active_border" = "rgb(f7768e) rgb(c0caf5)";
        "col.inactive_border" = "rgb(24283b)";

        layout = "dwindle";
      };
      decoration = {
        rounding = 12;
        blur = {
          enabled = true;
          size = 6;
          passes = 3;
          new_optimizations = true;
        };
        inactive_opacity = 1.0;
        active_opacity = 1.0;
        fullscreen_opacity = 1.0;

        drop_shadow = true;
        shadow_range = 60;
        shadow_offset = "0 5";
        shadow_render_power = 4;
        "col.shadow" = "rgba(00000099)";
      };
      animations = {
        enabled = true;
        bezier = [
          "fastBezier, 0.05, 1.1, 0.2, 1.0"
          "linear, 0.0, 0.0, 1.0, 1.0"
          "liner, 1, 1, 1, 1"
        ];
        animation = [
          "windows, 1, 7, fastBezier, slide"
          "windowsOut, 1, 7, fastBezier, slide"
          "border, 1, 10, fastBezier"
          "fade, 1, 7, fastBezier"
          "workspaces, 1, 6, fastBezier"
          "border, 1, 1, liner"
          "borderangle, 1, 40, liner, loop"
          "borderangle, 1, 100, linear, loop"
        ];
      };
      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };
      master = {
        new_is_master = true;
      };
      gestures = {
        workspace_swipe = false;
      };
      device = {
        name = "glorious-model-o-wireless";
        sensitivity = "-0.5";
      };
      misc = {
        disable_hyprland_logo = true;
      };
    };
    extraConfig = ''
      bind =, Print, exec, grim -g "$(slurp)" - | satty -f - --fullscreen --output-filename ~/Pictures/screenshots/$(date '+%Y%m%d-%H:%M:%S').png
    '';
  };
}
