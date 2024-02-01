{pkgs, ...}: {
  environment.systemPackages = [pkgs.attic];

  systemd.services.atticd = {
    enable = true;
    wantedBy = ["multi-user.target"];
    description = "atticd";

    serviceConfig = {
      User = "notoh";
      ExecStart = "${pkgs.attic}/bin/attic watch-store kyasshu";
      Restart = "always";
      RestartSec = 30;
    };
  };
}
