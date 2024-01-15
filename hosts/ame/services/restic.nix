{
  pkgs,
  config,
  ...
}: {
  sops.secrets.restic-ame = {
    sopsFile = ../../../secrets/restic/secrets.yaml;
  };
  environment.systemPackages = [pkgs.restic];
  services.restic = {
    backups = {
      ame = {
        paths = [
          "/home"
        ];
        exclude = [
          "*.qcow2"
          "*.iso"
          "/home/*/Downloads"
          "/home/*/Videos"
          "/home/*/.cache"
          "/home/*/.rustup"
          "/home/*/.cargo"
          "/home/*/.mplayer"
          "/home/*/.local/share/Trash"
          "/home/*/.local/share/.var"
        ];
        pruneOpts = [
          "--keep-daily=4"
          "--keep-weekly=3"
          "--keep-monthly=2"
        ];
        initialize = true;
        repository = "/nas/restic";
        passwordFile = config.sops.secrets.restic-ame.path;
        timerConfig = {
          OnCalendar = "daily";
        };
      };
    };
  };
}
