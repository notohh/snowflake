{pkgs, ...}: {
  environment.systemPackages = with pkgs; [rustypaste];

  systemd.services.rustypaste = {
    enable = true;
    wantedBy = ["multi-user.target"];
    description = "A minimal file upload/pastebin service.";
    environment = {
      CONFIG = "/var/lib/rustypaste/config.toml";
    };
    serviceConfig = {
      User = "root";
      ExecStart = "${pkgs.rustypaste}/bin/rustypaste";
      Restart = "always";
      RestartSec = 30;
      WorkingDirectory = "/var/lib/rustypaste";
    };
  };
}
