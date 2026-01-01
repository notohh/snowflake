{ inputs, pkgs, ... }:
{
  wayland.windowManager.hyprland = {
    settings = {
      monitor = [
        "HDMI-A-1,1920x1080@60, 3640x560, auto, transform, 3" # right
        "DP-3,1920x1080@60, 0x560, auto, transform, 1" # left
        "DP-2,1920x1080@144, 1400x0, auto" # top
        "DP-1,2560x1440@144, 1080x1080, auto" # middle
      ];
      exec-once =
        let
          inherit (pkgs.stdenv.hostPlatform) system;
          inherit (inputs.awww.packages.${system}) awww;
          wpDir = "/home/notoh/dev/assets/wallpapers/";
        in
        [

          "chatterino"
          "vesktop"
          "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
          "music-discord-rpc"
          "jellyfin-rpc"
          "${pkgs.hyprpolkitagent}/libexec/hyprpolkitagent"
          "${awww}/bin/awww-daemon"
          "${awww}/bin/awww img -o DP-1,DP-2 ${wpDir}mahou/Mahou.Tsukai.no.Yoru.full.3538207.jpg --transition-type center --transition-fps 144"
          "${awww}/bin/awww img -o DP-3,HDMI-A-1 ${wpDir}mahou/Kuonji.Alice.1024.4265428.webp --transition-type center --transition-fps 144"
          "vicinae server"
        ];
      input = {
        kb_layout = "us";
        follow_mouse = 1;
        sensitivity = "-0.5";
        force_no_accel = true;
      };
      general = {
        gaps_in = 10;
        gaps_out = 15;
        border_size = 0;
        "col.active_border" = "rgb(7dcfff) rgb(c0caf5)";
        "col.inactive_border" = "rgb(24283b)";

        layout = "dwindle";
        allow_tearing = true;
      };
      decoration = {
        rounding = 10;
        blur = {
          enabled = true;
          size = 6;
          passes = 3;
          new_optimizations = true;
        };
        shadow = {
          enabled = true;
          range = 60;
          offset = "0 5";
          render_power = 4;
          color = "rgba(00000099)";
        };
        inactive_opacity = 1.0;
        active_opacity = 1.0;
        fullscreen_opacity = 1.0;
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
        new_status = "master";
      };
      render = {
        direct_scanout = 0;
      };
      misc = {
        disable_hyprland_logo = true;
        mouse_move_enables_dpms = true;
        key_press_enables_dpms = false;
      };
      ecosystem = {
        no_update_news = true;
        no_donation_nag = true;
      };
      debug = {
        disable_logs = false;
      };
    };
  };
}
