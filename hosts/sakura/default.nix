{...}: {
  imports = [
    ./hardware-configuration.nix
    ./services
    ../../modules
  ];

  boot.loader = {
    grub = {
      enable = true;
      configurationLimit = 3;
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
}
