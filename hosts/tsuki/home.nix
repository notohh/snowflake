{pkgs, ...}: {
  imports = [
    ../../home
    ../../home/librewolf
    ../../home/wezterm
    ../../home/zathura
    ../../home/gtk
    ../../home/dunst
    ../../home/lf
    ../../home/zellij
    ../../home/waybar
    ../../home/wayland/hyprland
    ../../modules/swayidle.nix
  ];

  systemd.user.startServices = "sd-switch";
  programs.home-manager.enable = true;

  home = {
    username = "notoh";
    homeDirectory = "/home/notoh";
    packages = with pkgs; [
      (callPackage ../../pkgs/chatterino7 {})
      (callPackage ../../pkgs/rustypaste-cli {})
      bitwarden
      webcord
      spotify-player
      obs-studio
      pavucontrol
      unzip
      p7zip
      virt-manager
      imv
      mpv
      appimage-run
      qbittorrent
      gdu
      cryptomator
      ventoy-bin-full
      wine
      lutris
      gamemode
      gamescope
      mangohud
      bottles
      osu-lazer-bin
      runelite
      prismlauncher
    ];

    stateVersion = "23.05";
  };
}
