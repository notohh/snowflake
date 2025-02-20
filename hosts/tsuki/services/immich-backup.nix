{
  lib,
  pkgs,
  ...
}: {
  systemd = {
    services.immich-backup = let
      homeDir = "/home/notoh";
    in {
      script = ''
        ${lib.getExe pkgs.immich-cli} upload --album-name "desktop screenshots" --recursive ${homeDir}/Pictures/screenshots
      '';
      serviceConfig = {
        Type = "oneshot";
        User = "notoh";
      };
      environment = {
        IMMICH_CONFIG_DIR = "${homeDir}/.config/immich";
      };
    };
    timers.immich-backup = {
      wantedBy = ["timers.target"];
      description = "immich backup timer";
      timerConfig = {
        OnCalendar = "*-*-* 00:00:00";
        Persistent = true;
        Unit = "immich-backup.service";
      };
      unitConfig = {
        Description = "immich backup timer";
      };
    };
  };
}
