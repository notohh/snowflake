{config, pkgs, ...}:

{

imports = [
  ./gtk
  ./wezterm
  ./zathura
  ./nushell
  ./starship
  ./dunst
  ./helix
  ./git
  ./lazygit
  ./lf
  ./mpv
  ./waybar
  ./wayland/hyprland
];
 systemd.user.startServices = "sd-switch";
 programs.home-manager.enable = true;

  home = {
    username = "notoh";
    homeDirectory = "/home/notoh";
    stateVersion = "23.05";
    packages = with pkgs; [
      firefox
      neofetch
      bitwarden
      discord
      spotify-player
      btop
      nvtop
      obs-studio
      pavucontrol
      unzip
      p7zip
      virt-manager
      imv
      appimage-run
      qbittorrent
      gdu
      cryptomator
      jetbrains.pycharm-community
      chromium
      obsidian
      ventoy-bin-full
      yt-dlp
      wine
      lutris
      gamemode
      gamescope
      mangohud
      bottles
      osu-lazer-bin
      runelite
      prismlauncher
      cbonsai
      pipes-rs
      cmatrix
      cava
      hollywood
    ];
  };

}