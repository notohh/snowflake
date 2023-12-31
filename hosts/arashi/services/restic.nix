{
  pkgs,
  config,
  ...
}: {
  sops.secrets.restic-arashi = {
    sopsFile = ../../../secrets/restic/secrets.yaml;
  };
  environment.systemPackages = [pkgs.restic];
  services.restic = {
    backups = {
      arashi = {
        user = "root";
        paths = [
          "/var/backup/"
        ];
        pruneOpts = [
          "--keep-daily=7"
          "--keep-weekly=6"
          "--keep-monthly=5"
        ];
        initialize = true;
        repository = "/nas/restic";
        passwordFile = config.sops.secrets.restic-arashi.path;
        timerConfig = {
          OnCalendar = "daily";
          RandomizedDelaySec = "20m";
          Persistent = true;
        };
      };
    };
  };
}
