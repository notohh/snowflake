{ pkgs, ... }:
{
  users = {
    defaultUserShell = pkgs.nushell;
    users.notoh = {
      isNormalUser = true;
      uid = 1000;
      description = "notoh";
      extraGroups = [
        "networkmanager"
        "wheel"
        "disk"
        "video"
        "docker"
        "input"
      ];
    };
  };
}
