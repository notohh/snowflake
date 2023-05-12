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

  virtualisation.docker.enable = true;
  users = {
    defaultUserShell = pkgs.nushell;
    users.oh = {
      isNormalUser = true;
      description = "oh";
      extraGroups = ["networkmanager" "wheel" "docker"];
      packages = with pkgs; [
        hugo
        yt-dlp
      ];
    };
  };

  environment.systemPackages = with pkgs; [
    docker-compose
    wget
    python3Full
    nfs-utils
  ];
}
