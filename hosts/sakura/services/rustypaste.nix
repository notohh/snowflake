{pkgs, ...}: {
  environment.systemPackages = with pkgs; [rustypaste];

  users = {
    users.rustypaste = {
      isSystemUser = true;
      group = "rustypaste";
    };
    groups.rustypaste = {
      name = "rustypaste";
    };
  };

  systemd.services.rustypaste = {
    enable = true;
    wantedBy = ["multi-user.target"];
    description = "A minimal file upload/pastebin service.";
    environment = {
      CONFIG = "/var/lib/rustypaste/config.toml";
    };
    serviceConfig = {
      User = "rustypaste";
      ExecStart = "${pkgs.rustypaste}/bin/rustypaste";
      Restart = "always";
      RestartSec = 30;
      WorkingDirectory = "/var/lib/rustypaste";
    };
  };
}
