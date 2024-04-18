{pkgs, ...}: {
  users = {
    defaultUserShell = pkgs.nushell;
    extraUsers.greeter = {
      home = "/tmp/greeter-home";
      createHome = true;
    };
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
      ];
    };
  };
}
