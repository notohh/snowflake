{pkgs, ...}: {
  imports = [
    ../../home
    ../../home/librewolf
    ../../home/wezterm
    ../../home/zathura
    ../../home/lf
    ../../home/rofi
    ../../home/zellij
    ../../home/mako
    ../../home/wayland/river
    ../../home/wayland/river/waybar
  ];

  systemd.user.startServices = "sd-switch";
  programs.home-manager.enable = true;

  home = {
    username = "notoh";
    homeDirectory = "/home/notoh";
    packages = with pkgs; [
      webcord
      discord
      spotify-player
      pavucontrol
      unzip
      p7zip
      imv
      mpv
      rustypaste-cli
      playerctl
      logseq
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
      (callPackage ../../pkgs/chatterino7 {})
    ];

    stateVersion = "23.05";
  };
}
