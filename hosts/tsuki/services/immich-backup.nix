{
  lib,
  pkgs,
  ...
}: {
  systemd = {
    services.immich-backup = let
      homeDir = "/home/notoh";
    in {
      script = with pkgs; ''
        echo $DISPLAY
        export DISPLAY=:0.0
        echo $DISPLAY
        export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus
        ${lib.getExe immich-cli} upload --album-name "desktop screenshots" --recursive ${homeDir}/Pictures/screenshots
        ${lib.getExe immich-cli} upload --album-name "folderv2" --recursive ${homeDir}/Pictures/folderv2
        ${lib.getExe libnotify} --app-name "immich-backup" --urgency=low --icon=dialog-information "immich backup completed"
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
