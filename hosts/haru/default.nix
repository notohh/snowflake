{...}: {
  imports = [
    ./hardware-configuration.nix
    ./services
    ./networking.nix
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

  networking = {
    hostName = "haru";
  };

  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  users.users.notoh.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDdSO5g6IZQUzeH0Xf7hEVjKZ4cAWn/DjN+GQ2Ujd+qD haru"
  ];
  users.users.root.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMd8j1+fC/ng7l17rsxugVtlhurUe1ICizwA9lQkSuNY forgejo"
  ];
}
