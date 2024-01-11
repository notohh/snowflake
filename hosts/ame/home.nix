{pkgs, ...}: {
  imports = [
    ../../home
    ../../home/firefox
    ../../home/wezterm
    ../../home/zathura
    ../../home/zellij
    ../../home/mako
    ../../home/gtk/catppuccin-red.nix
  ];

  systemd.user.startServices = "sd-switch";
  programs.home-manager.enable = true;

  home = {
    username = "notoh";
    homeDirectory = "/home/notoh";
    packages = with pkgs; [
      discord
      spotify-player
      cinny-desktop
      pavucontrol
      unzip
      p7zip
      imv
      mpv
      rustypaste-cli
      playerctl
      obsidian
      cryptomator
      wayland
      glib
      grim
      slurp
      swappy
      wl-clipboard
      wlogout
      wlr-randr
      swayidle
      swaylock-effects
      swww
      hyprpicker
      (libsForQt5.callPackage ../../pkgs/chatterino7 {})
    ];

    stateVersion = "23.05";
  };
}
