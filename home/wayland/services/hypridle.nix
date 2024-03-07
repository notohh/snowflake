{
  pkgs,
  config,
  lib,
  ...
}: {
  services.hypridle = {
    enable = true;
    ignoreDbusInhibit = false;
    lockCmd = lib.getExe config.programs.hyprlock.package;
    beforeSleepCmd = "${pkgs.systemd}/bin/loginctl lock-session";
    listeners = [
      {
        timeout = 500;
        onTimeout = "${lib.getExe config.programs.hyprlock.package}";
      }
      {
        timeout = 560;
        onTimeout = "${config.wayland.windowManager.hyprland.package}/bin/hyprctl dispatch dpms off";
        onResume = "${config.wayland.windowManager.hyprland.package}/bin/hyprctl dispatch dpms on";
      }
    ];
  };
}
