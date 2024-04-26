{pkgs, ...}: {
  home.packages = with pkgs; [
    eww-wayland
    playerctl
    imagemagick
  ];

  programs.eww = {
    enable = false;
    package = pkgs.eww-wayland;
  };
}
