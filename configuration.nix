{ config, pkgs, inputs, ... }:

{
  imports =
    [ 
    ./hardware-configuration.nix
    ./modules/hyprland/default.nix
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

  networking.hostName = "nixos";

  networking.networkmanager.enable = true;
  networking.nameservers = [ "192.168.1.45" ];

  hardware.opentabletdriver.enable = true;
    
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
    printing = {
      enable = false;
    };
    xserver = {
     enable = true;
     videoDrivers = [ "nvidia" ];
     displayManager = {
       gdm.enable = true;
       gdm.wayland = true;
     };
    desktopManager = {
      plasma5.enable = true;
    };
   };
}; 

  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

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

  users = {
  defaultUserShell = pkgs.nushell;  
  users.notoh = {
    isNormalUser = true;
    description = "notoh";
    extraGroups = [ "networkmanager" "wheel" "disk" "video" ];
    packages = with pkgs; [
   # essential
      firefox
      helix
      neofetch
      bitwarden
      discord
      spotify
      mpv

   # coding
      jetbrains.pycharm-community
      lazygit

   # utility 
      waybar
      streamlink
      xplr
      btop
      nvtop
      obs-studio
      pavucontrol
      unzip
      etcher
      virt-manager 
      drawio
      imv
      nb
      zathura
      playerctl
      opentabletdriver
      onefetch

   # entertainment
      ani-cli
      trackma

   # gaming
      steam
      wine
      lutris
      gamemode
      gamescope
      bottles
      osu-lazer-bin
      prismlauncher

   # theming
      catppuccin-gtk
      catppuccin-cursors

   # fun stuff
      cbonsai
      pipes-rs
      cmatrix
      cava

    ];
  };
};

  environment.systemPackages = with pkgs; [
   wget
   git
   gh
   stow
   wezterm
   starship
   nushell
   rustup
   cargo
   jre
   jdk
   jq
   nodejs
   polkit_gnome
   appimage-run
   wireplumber
   dunst
   qt6.qtwayland
   qt5.qtwayland
   qt6.full
   qt5.full
   gcc
   cmake
   libvirt
   qemu_kvm
   python3Full
   python3.pkgs.pip
   gnome-themes-extra
   gtk-engine-murrine

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

  nixpkgs.config.permittedInsecurePackages = [
    "qtwebkit-5.212.0-alpha4"
    "electron-12.2.3"
  ];
   
nixpkgs.config.allowUnfree = true;
system.stateVersion = "23.05";

}
