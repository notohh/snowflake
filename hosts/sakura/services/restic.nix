{
  pkgs,
  config,
  ...
}: {
  sops.secrets.restic-sakura = {sopsFile = ../../../secrets/restic/secrets.yaml;};
  environment.systemPackages = [pkgs.restic];
  services.restic = {
    backups = {
      sakura = {
        user = "root";
        paths = [
          "/home/notoh/justlog"
          "/var/lib/rustypaste"
          "/var/lib/forgejo"
        ];
        exclude = [
          "/home/notoh/justlog/logs"
          "/var/lib/rustypaste/uploads"
        ];
        pruneOpts = [
          "--keep-daily=7"
          "--keep-weekly=6"
          "--keep-monthly=5"
        ];
        initialize = true;
        repository = "/nas/restic";
        passwordFile = config.sops.secrets.restic-sakura.path;
        timerConfig = {
          OnCalendar = "daily";
          RandomizedDelaySec = "20m";
          Persistent = true;
        };
      };
    };
  };
}
