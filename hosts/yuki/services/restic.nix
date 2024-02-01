{
  pkgs,
  config,
  ...
}: {
  sops.secrets.restic-yuki = {sopsFile = ../../../secrets/restic/secrets.yaml;};
  environment.systemPackages = [pkgs.restic];
  services.restic = {
    backups = {
      yuki = {
        user = "root";
        paths = [
          "/home/notoh/docker"
          "/var/lib/jellyfin"
          "/var/lib/private/jellyseerr"
          "/var/lib/private/homepage-dashboard"
        ];
        exclude = [
          "/home/notoh/docker/stash/data"
        ];
        pruneOpts = [
          "--keep-daily=7"
          "--keep-weekly=6"
          "--keep-monthly=5"
        ];
        initialize = true;
        repository = "/nas/restic";
        passwordFile = config.sops.secrets.restic-yuki.path;
        timerConfig = {
          OnCalendar = "daily";
          RandomizedDelaySec = "20m";
          Persistent = true;
        };
      };
    };
  };
}
