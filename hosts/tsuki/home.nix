{pkgs, ...}: {
  imports = [
    ../../home
    ../../home/librewolf
    ../../home/wezterm
    ../../home/zathura
    ../../home/gtk
    ../../home/mako
    ../../home/lf
    ../../home/zellij
    ../../home/rofi
    ../../home/ironbar
    ../../home/wayland/hyprland
    ../../modules/swayidle.nix
  ];

  systemd.user.startServices = "sd-switch";
  programs.home-manager.enable = true;

  home = {
    username = "notoh";
    homeDirectory = "/home/notoh";
    packages = with pkgs; [
      discord
      spotify-player
      obs-studio
      pavucontrol
      unzip
      p7zip
      virt-manager
      imv
      mpv
      playerctl
      logseq
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
      (callPackage ../../pkgs/chatterino7 {})
      (callPackage ../../pkgs/rustypaste-cli {})
    ];

    stateVersion = "23.05";
  };
}
