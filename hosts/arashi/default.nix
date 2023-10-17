{...}: {
  imports = [
    ./hardware-configuration.nix
    ./services
    ../../modules
    ../../modules/prometheus/exporters/redis.nix
    ../../modules/prometheus/exporters/postgres.nix
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
    hostName = "arashi";
  };

  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  users.users.notoh.openssh.authorizedKeys.keys = [
    ''ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKWRbIwwHuyEOLhA9dKTf4TgFqtPR5MNcJorKm731S7G arashi''
  ];
}
