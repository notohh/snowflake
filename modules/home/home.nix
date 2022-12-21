{ inputs, outputs, lib, config, pkgs, ... }: {
  # You can import other home-manager modules here
  imports = [

  ];

  programs.home-manager.enable = true;


  systemd.user.startServices = "sd-switch";


  home.stateVersion = "23.05";
}

