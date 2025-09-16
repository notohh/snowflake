{
  pkgs,
  config,
  ...
}:
{
  sops.secrets.restic-ame = {
    sopsFile = ../../../secrets/restic/secrets.yaml;
  };
  sops.secrets.ame-s3 = {
    sopsFile = ../../../secrets/s3/secrets.yaml;
  };
  environment.systemPackages = [ pkgs.restic ];
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
          "--keep-daily=7"
          "--keep-weekly=6"
          "--keep-monthly=5"
        ];
        initialize = true;
        repository = "s3:https://s3.flake.sh/restic-ame";
        passwordFile = config.sops.secrets.restic-ame.path;
        environmentFile = config.sops.secrets.ame-s3.path;
        timerConfig = {
          OnCalendar = "daily";
          Persistent = true;
        };
      };
    };
  };
}
