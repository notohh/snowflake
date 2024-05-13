{
  inputs,
  pkgs,
  lib,
  config,
  ...
}: {
  imports = [inputs.hypridle.homeManagerModules.default];
  disabledModules = ["${inputs.home-manager}/modules/services/hypridle.nix"];

  services.hypridle = {
    enable = true;
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
}
