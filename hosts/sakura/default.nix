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

  networking = {
    hostName = "sakura";
  };

  services.snowflake-proxy.enable = true;

  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  users.users.notoh.openssh.authorizedKeys.keys = [
    ''ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICqAjaV2D2J8ln4n39ZvszCF5Jql+0IaSpFCJlzDSLv6 sakura''
  ];
}
