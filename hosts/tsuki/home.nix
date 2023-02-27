{config, pkgs, ...}:

{

imports = [
  ../../modules/home/gtk
  ../../modules/home/wezterm
  ../../modules/home/zathura
  ../../modules/home/nushell
  ../../modules/home/starship
  ../../modules/home/dunst
  ../../modules/home/helix
  ../../modules/home/git
  ../../modules/home/lazygit
  ../../modules/home/lf
  ../../modules/home/mpv
  ../../modules/home/waybar
  ../../modules/home/wayland/hyprland
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