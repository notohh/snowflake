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
      floorp
      #brave
      discord
      cinny-desktop
      thunderbird
      obs-studio
      signal-desktop
      pavucontrol
      vscode-fhs
      obsidian
      unzip
      unrar
      p7zip
      virt-manager
      imv
      mpv
      rustypaste-cli
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
      yuzu
      inputs.nix-gaming.packages.${pkgs.system}.osu-lazer-bin
      inputs.nix-gaming.packages.${pkgs.system}.wine-discord-ipc-bridge
      (libsForQt5.callPackage ../../pkgs/chatterino7 {})
      (callPackage ../../pkgs/jellyfin-rpc {})
    ];

    stateVersion = "23.05";
  };
}
