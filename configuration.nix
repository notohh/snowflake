{ config, pkgs, inputs, ... }:

{
  imports =
    [ 
    ./hardware-configuration.nix
    ./modules/hyprland/default.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.configurationLimit = 5;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";
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
    xserver = {
     enable = true;
     videoDrivers = [ "nvidia" ];
     displayManager = {
       gdm.enable = true;
       gdm.wayland = true;
   };
  };
}; 

  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  services.printing.enable = true;
  services.fstrim.enable = true;

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
 
  # enable fish
  programs.fish.enable = true;
  users.defaultUserShell = pkgs.fish;

  #polkit
  security.polkit.enable = true;
  security.pam.services.swaylock = {
    text = ''
      auth include login
      '';
  };

  #users
  users.users.notoh = {
    isNormalUser = true;
    description = "notoh";
    extraGroups = [ "networkmanager" "wheel" "disk" "video" ];
    packages = with pkgs; [
   # essential
      firefox
      neovim
      neofetch
      bitwarden
      discord
      spotify-tui
      spotifyd
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
      obsidian
      obs-studio
      pavucontrol
      unzip
      etcher
      virt-manager
      playerctl
      drawio
      imv
      opentabletdriver

   # entertainment
      ani-cli
      trackma

   # gaming
      steam
      wine
      lutris
      bottles
      osu-lazer      

   # theming
      catppuccin-gtk

   # fun stuff
      cbonsai
      pipes-rs
      cmatrix
      cava

    ];
  };

  environment.systemPackages = with pkgs; [
   wget
   git
   gh
   alacritty
   stow
   starship
   rustup
   cargo
   jre
   jdk
   nodejs
   polkit_gnome
   appimage-run
   wireplumber
   dunst
   appimage-run
   qt6.qtwayland
   qt5.qtwayland
   qt6.full
   qt5.full
   libvirt
   qemu_kvm
   python3
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
        monospace = ["JetBrains Mono"];
        sansSerif = ["Google Sans Text"];
      };
      hinting.style = "hintfull";
    };
  };

 # programs
  programs.steam.enable = true;

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

   system.autoUpgrade = {
    enable = true;
    channel = "https://nixos.org/channel/nixos-unstable";
  };

 hardware = {
    nvidia = {
      powerManagement.enable = true;
      modesetting.enable = true;
    };
    opengl.extraPackages = with pkgs; [nvidia-vaapi-driver];
  };

    nix.settings = {
    substituters = ["https://hyprland.cachix.org"];
    trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
  };

  nixpkgs.config.permittedInsecurePackages = [
    "qtwebkit-5.212.0-alpha4"
    "electron-12.2.3"
  ];
   
nixpkgs.config.allowUnfree = true;
system.stateVersion = "23.05";

}
