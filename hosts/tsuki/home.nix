{config, pkgs, ...}:

{

imports = [
  ../../home
  ../../home/wezterm
  ../../home/zathura
  ../../home/gtk
  ../../home/dunst
  ../../home/lf
  ../../home/mpv
  ../../home/zellij
  ../../home/waybar
  ../../home/wayland/hyprland
];

 systemd.user.startServices = "sd-switch";
 programs.home-manager.enable = true;

  home = {
    username = "notoh";
    homeDirectory = "/home/notoh";
    packages = with pkgs; [
      firefox
      neofetch
      bitwarden
      discord
      spotify-player
      btop
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
      plex-media-player
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
    
    stateVersion = "23.05";
  };
}