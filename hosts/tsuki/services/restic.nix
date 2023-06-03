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
          "/home/*/Downloads"
          "/home/*/Games"
          "/home/*/Videos"
          "/home/*/cryptomator"
          "/home/*/.cache"
          "/home/*/.wine"
          "/home/*/.rustup"
          "/home/*/.cargo"
          "/home/*/.local/share/Trash"
          "/home/*/.local/share/Steam"
          "/home/*/.local/share/.var"
          "*.qcow2"
          "*.iso"
        ];
        pruneOpts = [
          "--keep-daily=5"
          "--keep-weekly=3"
          "--keep-monthly=2"
        ];
        initialize = true;
        repository = "/nas/home";
        passwordFile = config.sops.secrets.restic-repo-pwd.path;
        timerConfig = {
          OnCalendar = "daily";
        };
      };
    };
  };
}
