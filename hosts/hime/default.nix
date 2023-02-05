{ config, pkgs, ... }:

{
  imports =
    [
    ./hardware-configuration.nix
    ];

  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;

  networking.hostName = "hime";
  networking.networkmanager.enable = true;

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
   passwordAuthentication = true;
   kbdInteractiveAuthentication = false;
  };

  virtualisation.docker.enable = true;
  users.users.oh = {
    isNormalUser = true;
    description = "oh";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
     neofetch
     helix
     lazygit
     hugo
   ];
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
     docker-compose
     wget
     python3Full
     python3.pkgs.pip
     git
     gh
  ];

  nix = {
    package = pkgs.nixFlakes;
    extraOptions = ''
     experimental-features = nix-command flakes
     warn-dirty = false
    '';
  };

  system.stateVersion = "23.05";
}
