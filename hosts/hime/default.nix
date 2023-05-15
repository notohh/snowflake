{pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
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
    hostName = "hime";
  };

  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  users = {
    defaultUserShell = pkgs.nushell;
    users.oh = {
      isNormalUser = true;
      description = "oh";
      extraGroups = ["networkmanager" "wheel" "docker"];
    };
  };

  environment.systemPackages = with pkgs; [
    wget
  ];
}
