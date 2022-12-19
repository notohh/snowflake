# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)

{ inputs, outputs, lib, config, pkgs, ... }: {
  # You can import other home-manager modules here
  imports = [

  ];

  nixpkgs = {

    overlays = [
 
    ];

    config = {

      allowUnfree = true;
     
      allowUnfreePredicate = (_: true);
    };
  };


  home = {
    username = "notoh";
    homeDirectory = "/home/notoh/";
  };

  programs.home-manager.enable = true;
  programs.git.enable = true;


  systemd.user.startServices = "sd-switch";


  home.stateVersion = "23.05";
}

