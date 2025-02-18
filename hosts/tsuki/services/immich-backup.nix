{
  lib,
  pkgs,
  ...
}: {
  systemd = {
    services.immich-backup = let
      homeDir = "/home/notoh";
    in {
      enable = true;
      wantedBy = ["multi-user.target"];
      description = "immich backup service";
      script = ''
        ${lib.getExe pkgs.immich-cli} upload --album-name "screenshots" --recursive ${homeDir}/Pictures/screenshots
      '';
      environment = {
        IMMICH_CONFIG_DIR = "${homeDir}/.config/immich";
      };
    };
    timers.immich-backup = {
      enable = true;
      wantedBy = ["timers.target"];
      description = "immich backup timer";
      timerConfig = {
        OnCalendar = "*-*-* 00:00:00";
        Persistent = true;
      };
      unitConfig = {
        Description = "immich backup timer";
      };
    };
  };
}
