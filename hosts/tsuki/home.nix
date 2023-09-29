{pkgs, ...}: {
  imports = [
    ../../home
    ../../home/wezterm
    ../../home/zathura
    ../../home/gtk
    ../../home/mako
    ../../home/lf
    ../../home/zellij
    ../../home/rofi
    ../../home/ironbar
    ../../home/spotify-player
    ../../home/wayland/hyprland
    ../../modules/swayidle.nix
  ];

  systemd.user.startServices = "sd-switch";
  programs.home-manager.enable = true;

  home = {
    username = "notoh";
    homeDirectory = "/home/notoh";
    packages = with pkgs; [
      brave
      discord
      signal-desktop
      jellyfin-media-player
      cinny-desktop
      thunderbird
      obs-studio
      pavucontrol
      vscode-fhs
      unzip
      p7zip
      virt-manager
      imv
      mpv
      rustypaste-cli
      playerctl
      obsidian
      drawio
      gimp
      cryptomator
      ventoy-bin-full
      wine
      lutris
      gamemode
      mangohud
      bottles
      osu-lazer-bin
      runelite
      prismlauncher
      (callPackage ../../pkgs/chatterino7 {})
      (callPackage ../../pkgs/jellyfin-rpc {})
    ];

    stateVersion = "23.05";
  };
}
