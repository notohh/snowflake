{ config, pkgs, ... }:

{
  imports =
    [ 
    ./hardware-configuration.nix
    ../../modules
    ];

  boot.loader = {
    grub = {
      enable = true;
      configurationLimit = 3;
      device = "/dev/sda";
      useOSProber = false;
    };
  };
  
   networking = {
    hostName = "sutakku";
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
    extraGroups = [ "networkmanager" "wheel" ];
  };
};

  environment.systemPackages = with pkgs; [
    wget
    nfs-utils
    pinentry-curses
  ];

   programs.gnupg.agent = {
     enable = true;
     enableSSHSupport = true;
     pinentryFlavor = "curses";
   };

   services.openssh.enable = true;
}
