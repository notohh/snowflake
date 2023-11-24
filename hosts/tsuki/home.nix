{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    ../../home
    ../../home/ags
    ../../home/anyrun
    ../../home/cava
    ../../home/wezterm
    ../../home/zathura
    ../../home/gtk
    ../../home/mako
    ../../home/lf
    ../../home/zellij
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
      drawio
      obsidian
      gimp
      cryptomator
      ventoy-bin-full
      wine
      lutris
      gamemode
      mangohud
      bottles
      runelite
      prismlauncher
      inputs.nix-gaming.packages.${pkgs.system}.osu-lazer-bin
      (libsForQt5.callPackage ../../pkgs/chatterino7 {})
      (callPackage ../../pkgs/jellyfin-rpc {})
    ];

    stateVersion = "23.05";
  };
}
