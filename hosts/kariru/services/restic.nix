{
  pkgs,
  config,
  ...
}:
{
  sops.secrets.restic-kariru = {
    sopsFile = ../../../secrets/restic/secrets.yaml;
  };
  environment.systemPackages = [ pkgs.restic ];
  services.restic = {
    backups = {
      kariru = {
        user = "root";
        paths = [
          "/var/lib/radarr"
          "/var/lib/sonarr"
          "/var/lib/sabnzbd"
          "/var/lib/private/prowlarr"
        ];
        pruneOpts = [
          "--keep-daily=7"
          "--keep-weekly=6"
          "--keep-monthly=5"
        ];
        initialize = true;
        repository = "/nas/restic";
        passwordFile = config.sops.secrets.restic-kariru.path;
        timerConfig = {
          OnCalendar = "daily";
          RandomizedDelaySec = "20m";
          Persistent = true;
        };
      };
    };
  };
}
