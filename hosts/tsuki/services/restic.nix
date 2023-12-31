{
  pkgs,
  config,
  ...
}: {
  sops.secrets.restic-repo-pwd = {};
  environment.systemPackages = [pkgs.restic];
  services.restic = {
    backups = {
      tsuki = {
        paths = [
          "/home"
        ];
        exclude = [
          "*.qcow2"
          "*.iso"
          "/home/*/Downloads"
          "/home/*/Games"
          "/home/*/Videos"
          "/home/*/osu!"
          "/home/*/mounted"
          "/home/*/cryptomator/mounted"
          "/home/*/.cache"
          "/home/*/.wine"
          "/home/*/.rustup"
          "/home/*/.cargo"
          "/home/*/.factorio"
          "/home/*/.mplayer"
          "/home/*/.steam"
          "/home/*/.eclipse"
          "/home/*/.bundle"
          "/home/*/.local/share/Trash"
          "/home/*/.local/share/Steam"
          "/home/*/.local/share/.var"
        ];
        pruneOpts = [
          "--keep-daily=8"
          "--keep-weekly=6"
          "--keep-monthly=5"
        ];
        initialize = true;
        repository = "/nas/home";
        passwordFile = config.sops.secrets.restic-repo-pwd.path;
        timerConfig = {
          OnCalendar = "daily";
          RandomizedDelaySec = "10m";
          Persistent = true;
        };
      };
    };
  };
}
