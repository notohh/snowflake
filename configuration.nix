# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, flake-self, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./modules/hyprland/default.nix 
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.configurationLimit = 5;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";
  boot.extraModulePackages = with config.boot.kernelPackages;
  [ v4l2loopback.out ];
  boot.kernelModules = [ "v4l2loopback" ];

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/New_York";

  # Select internationalisation properties.
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
    desktopManager.plasma5.enable = true;
  };
}; 

  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  services.printing.enable = true;
  services.spotifyd.enable = true;

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

  programs.steam.enable = true;

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
      ani-cli
      trackma
   # utility
      hyprpaper
      waybar
      streamlink
      ranger
      btop
      obsidian
      lazygit
      obs-studio
      pavucontrol
   # gaming
      steam
      wine
      lutris
      bottles
      gamescope

   # fun stuff
      cbonsai
      pipes-rs
      cmatrix

    ];
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
   wget
   git
   alacritty
   gcc
   stow
   starship
   rustup
   cargo
   jre
   jdk
   nodejs
   polkit_gnome
   appimage-run
   wlogout
   wireplumber
   dunst
   appimage-run
   qt6.qtwayland
   qt5.qtwayland
   qt6.full
   qt5.full
   cmake
   meson
   python3
   python3.pkgs.pip
  ];

  system.stateVersion = "23.05"; # Did you read the comment?

  nix = {
     package = pkgs.nixFlakes;
     extraOptions = "experimental-features = nix-command flakes";
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

   fonts = {
    enableDefaultFonts = true;
    fontDir.enable = true;

    fonts = with pkgs; [
      inter
      jetbrains-mono
      nerdfonts
      noto-fonts-cjk-sans
      recursive
      rubik
      twemoji-color-font
      font-awesome
      powerline-fonts
      fira-code-symbols
    ];

    fontconfig = {
      enable = true;
      allowBitmaps = true;
      defaultFonts = {
        monospace = ["Maple Mono NF"];
        sansSerif = ["Google Sans Text"];
      };
      hinting.style = "hintfull";
    };
  };

  nixpkgs.config.permittedInsecurePackages = [
       "qtwebkit-5.212.0-alpha4"
  ];

}

