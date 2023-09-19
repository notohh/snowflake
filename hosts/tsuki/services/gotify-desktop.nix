{pkgs, ...}: {
  systemd.services.gotify-desktop = {
    enable = true;
    wantedBy = [
      "multi-user.target"
    ];
    description = "Small Gotify daemon to send messages as desktop notifications";
    serviceConfig = {
      User = "notoh";
      ExecStart = "${pkgs.gotify-desktop}/bin/gotify-desktop";
      Restart = "always";
      RestartSec = 30;
    };
  };
}
