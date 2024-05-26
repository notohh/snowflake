{
  pkgs,
  lib,
  config,
  ...
}: {
  services.hypridle = {
    enable = true;
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
          timeout = 460;
          on-timeout = "${pkgs.systemd}/bin/systemctl suspend";
        }
      ];
    };
  };
}
