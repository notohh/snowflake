{pkgs, ...}: {
  environment.systemPackages = [pkgs.attic-client];

  systemd.services.atticd = {
    enable = true;
    wantedBy = ["multi-user.target"];
    description = "atticd";

    serviceConfig = {
      User = "notoh";
      ExecStart = "${pkgs.attic-client}/bin/attic watch-store kyasshu";
      Restart = "always";
      RestartSec = 30;
    };
  };
}
