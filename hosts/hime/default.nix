{ 
  pkgs, 
  ... 
}: {
  imports =
    [
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

  time.timeZone = "America/New_York";

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

   services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  services.openssh = {
   enable = true;
   settings = {
    PasswordAuthentication = true;
  };
};

  services.fstrim = {
    enable = true;
  };

  virtualisation.docker.enable = true;
  users ={
  defaultUserShell = pkgs.nushell;
  users.oh = {
    isNormalUser = true;
    description = "oh";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
     hugo
     yt-dlp
   ];
  };
};

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
     docker-compose
     wget
     python3Full
     nfs-utils
  ];

  nix = {
    package = pkgs.nixFlakes;
    extraOptions = ''
     experimental-features = nix-command flakes
     warn-dirty = false
    '';
    settings.auto-optimise-store = true;
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  system.stateVersion = "23.05";
}
