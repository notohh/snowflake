{
  pkgs,
  lib,
  ...
}: {
  environment.systemPackages = [pkgs.attic-client];

  systemd.services.atticd = {
    enable = true;
    wantedBy = ["multi-user.target"];
    description = "atticd";

    serviceConfig = {
      User = "notoh";
      ExecStart = "${lib.getExe pkgs.attic-client} watch-store kyasshu";
      Restart = "always";
      RestartSec = 30;
    };
  };
}
