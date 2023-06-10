{pkgs, ...}: {
  imports = [
    ../../home
    ../../home/librewolf
    ../../home/wezterm
    ../../home/zathura
    ../../home/lf
    ../../home/zellij
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
      (callPackage ../../pkgs/chatterino7 {})
    ];

    stateVersion = "23.05";
  };
}
