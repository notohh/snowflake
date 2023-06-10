{pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ./services
    ../../modules
  ];

  boot.loader = {
    systemd-boot = {
      enable = true;
      configurationLimit = 8;
    };
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot/efi";
    };
  };

  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "yuki";

  networking.networkmanager.enable = true;

  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };
}
