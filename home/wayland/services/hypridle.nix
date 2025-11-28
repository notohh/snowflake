{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:
{
  services.hypridle = {
    enable = true;
    package = inputs.hypridle.packages.${pkgs.stdenv.hostPlatform.system}.default;
    settings = {
      general = {
        ignore_dbus_inhibit = false;
        lock_cmd = lib.getExe config.programs.hyprlock.package;
        before_sleep_cmd = "${pkgs.systemd}/bin/loginctl lock-session";
      };
      listener = [
        {
          timeout = 400;
          on-timeout = "${lib.getExe config.programs.hyprlock.package}";
        }
        {
          timeout = 450;
          on-timeout = "${
            inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland
          }/bin/hyprctl dispatch dpms off";
        }
      ];
    };
  };
}
