{pkgs, ...}: {
  home.packages = with pkgs; [
    eww
    playerctl
    imagemagick
  ];

  programs.eww = {
    enable = false;
    package = pkgs.eww-wayland;
  };
}
