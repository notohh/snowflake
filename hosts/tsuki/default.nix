{ config, pkgs, inputs, ... }:

{
  imports =
    [ 
    ./hardware-configuration.nix
    ../../modules/home/wayland
    ];

  # bootloader 
  boot.loader = {
    systemd-boot = {
      enable = true;
      configurationLimit = 5;
    };
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot/efi";
    };
  };

  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.extraModulePackages = with config.boot.kernelPackages;
  [ v4l2loopback.out ];
  boot.kernelModules = [ "v4l2loopback" "kvm-intel" ];

  virtualisation.libvirtd.enable = true;

  networking.hostName = "tsuki";

  networking.networkmanager.enable = true;
  networking.nameservers = [ "192.168.1.45" ];
    
  # pihole
    environment.etc = {
    "resolv.conf".text = "nameserver 192.168.1.45\n";
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
     displayManager = {
      lightdm = {
        enable = false;
      };
    };
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
 };

  users = {
  defaultUserShell = pkgs.nushell;
  users.notoh = {
    isNormalUser = true;
    description = "notoh";
    extraGroups = [ "networkmanager" "wheel" "disk" "video" ];
    packages = with pkgs; [
   # essential
      firefox
      neofetch
      bitwarden
      spotify-player
      discord-ptb

   # dev
      jetbrains.pycharm-community

   # utility 
      btop
      nvtop
      obs-studio
      pavucontrol
      unzip
      p7zip
      etcher
      virt-manager
      imv
      ani-cli
      trackma
      appimage-run
      qbittorrent
      gdu
      cryptomator
      gimp
      chromium
      
   # gaming
      wine
      lutris
      gamemode
      gamescope
      mangohud
      bottles
      osu-lazer-bin
      runelite
      prismlauncher

   # fun stuff
      cbonsai
      pipes-rs
      cmatrix
      cava
      hollywood
    ];
  };
};

  environment.systemPackages = with pkgs; [
   wget
   dconf
   rustup
   cargo
   jre
   nodejs
   polkit_gnome
   libvirt
   qemu_kvm
   python3Full
   python3.pkgs.pip
   gtk-engine-murrine
   pinentry-gtk2
   nil
   rust-analyzer
   gopls
   sumneko-lua-language-server
   marksman
   nodePackages_latest.yaml-language-server
   python310Packages.python-lsp-server
  
 ];

  fonts = {
    enableDefaultFonts = true;
    fontDir.enable = true;
    fonts = with pkgs; [
      inter
      jetbrains-mono
      nerdfonts
      noto-fonts-cjk-sans
      twemoji-color-font
      font-awesome
      fira-code-symbols
      kochi-substitute
      ipafont
    ];

    fontconfig = {
      enable = true;
      allowBitmaps = true;
      defaultFonts = {
        monospace = ["JetBrainsMono Nerd Font Regular"];
        sansSerif = ["Google Sans Text"];
      };
      hinting.style = "hintfull";
    };
  };

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
     settings = {
      substituters = [
      "https://hyprland.cachix.org"
      "https://cache.nixos.org?priority=10"
      ];
      trusted-public-keys = [
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      ];
     };
   };

   system.autoUpgrade = {
    enable = false;
    channel = "https://nixos.org/channel/nixos-unstable";
  };

  nixpkgs.config.permittedInsecurePackages = [
    "qtwebkit-5.212.0-alpha4"
    "electron-12.2.3"
  ];
   
nixpkgs.config.allowUnfree = true;
system.stateVersion = "23.05";

}
