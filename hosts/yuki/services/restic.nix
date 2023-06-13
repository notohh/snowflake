{
  pkgs,
  config,
  ...
}: {
  sops.secrets.restic-repo-pwd = {};
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
          "/home/*/.cache"
          "/home/*/.local/share/Trash"
          "/home/*/.local/share/.var"
        ];
        pruneOpts = [
          "--keep-daily=4"
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
