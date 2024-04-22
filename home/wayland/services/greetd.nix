{
  pkgs,
  inputs,
  lib,
  ...
}: let
  hyprlandGreetdConf = pkgs.writeText "hyprland-greetd-conf.conf" ''

    monitor = HDMI-A-1,disable
    monitor = DP-1,disable
    monitor = DP-2,2560x1440@144, 0x0, auto
    monitor = DP-3,disable

    env = LIBVA_DRIVER_NAME,nvidia
    env = XDG_SESSION_TYPE,wayland
    env = GBM_BACKEND,nvidia-drm
    env = __GLX_VENDOR_LIBRARY_NAME,nvidia
    env = WLR_NO_HARDWARE_CURSORS,1

    exec-once = ${pkgs.dbus}/bin/dbus-update-activation-environment --systemd DISPLAY WAYLAND_DISPLAY XDG_CURRENT_DESKTOP HYPRLAND_INSTANCE_SIGNATURE
    exec-once = ${lib.getExe pkgs.greetd.regreet}; hyprctl dispatch exit
    exec-once = systemctl --user restart xdg-desktop-portal xdg-desktop-portal-hyprland

    windowrulev2 = fullscreen, title:^regreet$
    windowrulev2 = move 0 0, title:^regreet$

    $mainMod = SUPER
    bind = $mainMod, Q, exec, reboot
    bind = $mainMod, Return, exec, ${lib.getExe pkgs.greetd.regreet}

    input {
      kb_layout = us
      follow_mouse = 1
      sensitivity = -0.5
      force_no_accel = true
    }

    animations {
      enabled = false
      first_launch_animation = false
    }

    misc {
      disable_hyprland_logo = true
      disable_splash_rendering = true
    }

  '';
in {
  services.greetd = {
    enable = true;
    settings = rec {
      initial_session = {
        command = "${lib.getExe inputs.hyprland.packages.${pkgs.system}.default} --config ${hyprlandGreetdConf}";
        user = "greeter";
      };
      default_session = initial_session;
    };
  };
  programs.regreet = {
    enable = true;
    settings = {
      background.path = "/etc/greetd/frieren.png";
      env = {
        SESSION_DIRS = "/etc/greetd/environments";
      };
      terminal = {
        vt = 1;
      };
      commands = {
        reboot = ["systemctl" "reboot"];
        poweroff = ["systemctl" "poweroff"];
      };
      GTK = {
        application_prefer_dark_theme = true;
        theme_name = "Tokyonight-Dark-BL";
        icon_theme_name = "Papirus-Dark";
        cursor_theme_name = "Bibata-Modern-Classic";
        font_name = "Noto Sans 11";
      };
    };
  };
}
