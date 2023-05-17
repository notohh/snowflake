{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ../../modules
    ../../modules/services/arr
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
    hostName = "kariru";
  };

  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
    pinentryFlavor = "curses";
  };
}
