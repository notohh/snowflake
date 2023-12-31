{
  pkgs,
  config,
  ...
}: {
  sops.secrets = {
    restic-repo-pwd-sora = {};
    sora-b2 = {};
  };
  environment.systemPackages = [pkgs.restic];
  services.restic = {
    backups = {
      sora = {
        user = "root";
        paths = [
          "/var/lib/uptime-kuma"
          "/var/lib/ntfy-sh"
        ];
        pruneOpts = [
          "--keep-daily=8"
          "--keep-weekly=6"
          "--keep-monthly=5"
        ];
        repository = "b2:sora-b2";
        initialize = true;
        passwordFile = config.sops.secrets.restic-repo-pwd-sora.path;
        environmentFile = config.sops.secrets.sora-b2.path;
        timerConfig = {
          OnCalendar = "daily";
          Persistent = true;
        };
      };
    };
  };
}
