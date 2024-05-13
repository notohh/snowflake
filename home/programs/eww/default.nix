{pkgs, ...}: {
  home.packages = with pkgs; [
    eww
    playerctl
    imagemagick
  ];

  programs.eww = {
    enable = true;
    package = pkgs.eww;
    configDir = ./config;
  };
}
