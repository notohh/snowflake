{...}: {
  imports = [
    ./hardware-configuration.nix
    ./services
    ../../modules
  ];

  boot.loader = {
    grub = {
      enable = true;
      configurationLimit = 5;
      device = "/dev/sda";
      useOSProber = false;
    };
  };

  boot.kernel.sysctl = {
    "kernel.shmmax" = 100663296;
  };

  networking = {
    hostName = "arashi";
  };

  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  users.users.notoh.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKWRbIwwHuyEOLhA9dKTf4TgFqtPR5MNcJorKm731S7G arashi"
  ];
  users.users.root.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINGPcRO9BzKIhAxiyVnRIcByaMTrxeeeJqB8iXcmhrI4 forgejo"
  ];
}
