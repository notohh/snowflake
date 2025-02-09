{
  pkgs,
  lib,
  ...
}: {
  # oneshot service to resize the main monitor
  systemd.services.fbset = {
    enable = true;
    wantedBy = ["multi-user.target"];
    unitConfig = {
      Description = "Framebuffer resolution";
      Before = "display-manager.service";
    };
    serviceConfig = {
      User = "root";
      Type = "oneshot";
      ExecStart = "${lib.getExe pkgs.fbset} -xres 2560 -yres 1440 -match --all";
      RemainAfterExit = "yes";
      StandardOutput = "journal";
      StandardError = "journal";
    };
  };
  services.displayManager.ly = {
    enable = true;
    settings = {
      load = true;
      save = true;
      animation = "matrix";
      clear_password = true;
      vi_mode = true;
    };
  };
}
