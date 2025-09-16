{
  pkgs,
  config,
  ...
}:
{
  sops.secrets = {
    restic-sora = {
      sopsFile = ../../../secrets/restic/secrets.yaml;
    };
    sora-s3 = {
      sopsFile = ../../../secrets/s3/secrets.yaml;
    };
  };
  environment.systemPackages = [ pkgs.restic ];
  services.restic = {
    backups = {
      sora = {
        user = "root";
        paths = [
          "/var/lib/private/uptime-kuma"
          "/var/lib/private/ntfy-sh"
        ];
        pruneOpts = [
          "--keep-daily=7"
          "--keep-weekly=6"
          "--keep-monthly=5"
        ];
        repository = "s3:https://s3.wasabisys.com/sora-restic";
        initialize = true;
        passwordFile = config.sops.secrets.restic-sora.path;
        environmentFile = config.sops.secrets.sora-s3.path;
        timerConfig = {
          OnCalendar = "daily";
          Persistent = true;
        };
      };
    };
  };
}
