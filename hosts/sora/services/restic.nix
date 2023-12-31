{
  pkgs,
  config,
  ...
}: {
  sops.secrets = {
    restic-sora = {
      sopsFile = ../../../secrets/restic/secrets.yaml;
    };
    sora-b2 = {
      sopsFile = ../../../secrets/b2/secrets.yaml;
    };
  };
  environment.systemPackages = [pkgs.restic];
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
        repository = "b2:sora-b2";
        initialize = true;
        passwordFile = config.sops.secrets.restic-sora.path;
        environmentFile = config.sops.secrets.sora-b2.path;
        timerConfig = {
          OnCalendar = "daily";
          Persistent = true;
        };
      };
    };
  };
}
