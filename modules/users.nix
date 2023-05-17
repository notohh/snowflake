{pkgs, ...}: {
  users = {
    defaultUserShell = pkgs.nushell;
    users.notoh = {
      isNormalUser = true;
      description = "notoh";
      extraGroups = [
        "networkmanager"
        "wheel"
        "disk"
        "video"
        "docker"
      ];
    };
  };
}
