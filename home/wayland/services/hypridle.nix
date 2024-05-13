{
  pkgs,
  lib,
  config,
  ...
}: {
  services.hypridle = {
    enable = true;
    settings = {
      ignoreDbusInhibit = false;
      lockCmd = lib.getExe config.programs.hyprlock.package;
      beforeSleepCmd = "${pkgs.systemd}/bin/loginctl lock-session";
      listeners = [
        {
          timeout = 400;
          onTimeout = "${lib.getExe config.programs.hyprlock.package}";
        }
        {
          timeout = 460;
          onTimeout = "${pkgs.systemd}/bin/systemctl suspend";
        }
      ];
    };
  };
}
