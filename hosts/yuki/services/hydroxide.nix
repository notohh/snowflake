{pkgs, ...}: {
  environment.systemPackages = [pkgs.hydroxide];
  networking.firewall.allowedTCPPorts = [1025 1143];

  systemd.services.hydroxide = {
    enable = true;
    wantedBy = ["multi-user.target"];
    description = "A third-party, open-source ProtonMail bridge";

    serviceConfig = {
      User = "notoh";
      ExecStart = "${pkgs.hydroxide}/bin/hydroxide -disable-carddav serve";
      Restart = "always";
      RestartSec = 30;
    };
  };
}
