{ 
  config, 
  pkgs, 
  ... 
}: {
  imports =
    [ 
    ./hardware-configuration.nix
    ../../home/wayland
    ../../modules
    ../../modules/fonts.nix
    ];

  # bootloader 
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
  boot.extraModulePackages = with config.boot.kernelPackages; [ v4l2loopback.out ];
  boot.kernelModules = [ "v4l2loopback" "kvm-intel" ];

  virtualisation.libvirtd.enable = true;

  networking = {
    networkmanager.enable = true;
    nameservers = [ "192.168.1.83" ];
    hostName = "tsuki";
    firewall = {
      enable = true;
    };
  };

  # pihole
    environment.etc = {
    "resolv.conf".text = "nameserver 192.168.1.83\n";
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

  services = {
    fstrim = {
      enable = true;
    };
    xserver = {
     enable = true;
     videoDrivers = [ "nvidia" ];
     layout = "us";
     xkbVariant = "";
  };
 };

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
    pinentryFlavor = "gtk2";
  };

  services.pcscd.enable = true;

  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    wireplumber.enable = true;
  };

  programs.steam = {
    enable = true;
  };
  
  security.polkit.enable = true;
  security.pam.services.swaylock = {
    text = ''
      auth include login
      '';
  };
  
 hardware = {
    nvidia = {
      powerManagement.enable = true;
      modesetting.enable = true;
      package = config.boot.kernelPackages.nvidiaPackages.stable;
    };
    opengl = {
    enable = true;
    extraPackages = with pkgs; [
    nvidia-vaapi-driver
    ];
   };
  opentabletdriver = {
    enable = true;
    daemon.enable = true;
  };
 };
  users = {
  defaultUserShell = pkgs.nushell;
  users.notoh = {
    isNormalUser = true;
    description = "notoh";
    extraGroups = [ "networkmanager" "wheel" "disk" "video" ];
  };
};

  environment.systemPackages = with pkgs; [
   wget
   dconf
   rustc
   rustup
   rustfmt
   go
   cargo
   nodejs
   polkit_gnome
   libvirt
   qemu_kvm
   gtk-engine-murrine
   pinentry-gtk2
   nfs-utils
   nil
   rust-analyzer
   gopls
   sumneko-lua-language-server
   marksman
   texlab
   jre8
   jdk17
   jdk8
   nodePackages_latest.yaml-language-server
   python310Packages.python-lsp-server
 ];

   nix = {
     package = pkgs.nixFlakes;
     extraOptions = ''
      experimental-features = nix-command flakes
      warn-dirty = false
      ''; 
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
     settings = {
      auto-optimise-store = true;
      builders-use-substitutes = true;
      substituters = [
      "https://hyprland.cachix.org"
      "https://cache.nixos.org"
      ];
      trusted-public-keys = [
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      ];
     };
   };

  nixpkgs.config = {
    permittedInsecurePackages = [
    "qtwebkit-5.212.0-alpha4"
    "electron-12.2.3"
  ];
  allowUnfree = true;
};

system.stateVersion = "23.05";

}
