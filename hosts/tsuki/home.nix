{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    ../../home
    ../../home/firefox
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
    ../../home/wayland/services/hypridle.nix
    ../../home/wayland/programs/hyprlock.nix
  ];

  systemd.user.startServices = "sd-switch";
  programs.home-manager.enable = true;

  home = {
    username = "notoh";
    homeDirectory = "/home/notoh";
    packages = with pkgs; [
      chromium
      discord
      cinny-desktop
      thunderbird
      obs-studio
      pavucontrol
      anki
      tomato-c
      distrobox
      gpg-tui
      vscode-fhs
      obsidian-wayland
      jellyfin-mpv-shim
      virt-manager
      imv
      mpv
      ffmpeg
      rustypaste-cli
      gimp
      cryptomator
      ventoy-bin-full
      wine
      lutris
      mangohud
      bottles
      prismlauncher
      inputs.nix-gaming.packages.${pkgs.system}.osu-lazer-bin
      (libsForQt5.callPackage ../../pkgs/chatterino7 {})
      (callPackage ../../pkgs/jellyfin-rpc {})
    ];
    stateVersion = "23.05";
  };

  programs.ssh = {
    enable = true;
    extraConfig = ''
      Host sakura
        Hostname 100.121.201.47
        User notoh
        IdentityFile ~/.ssh/sakura
      Host kariru
        Hostname 100.126.229.95
        User notoh
        IdentityFile ~/.ssh/kariru
      Host yuki
        Hostname 100.108.113.89
        User notoh
        IdentityFile ~/.ssh/yuki
      Host arashi
        Hostname 100.94.214.100
        User notoh
        IdentityFile ~/.ssh/arashi
      Host sora
        Hostname 100.104.42.96
        User notoh
        IdentityFile ~/.ssh/sora
      Host daphbot
        Hostname 100.109.118.139
        User root
        IdentityFile ~/.ssh/daphbot
      Host tsuru
        Hostname 100.82.146.40
        User notoh
        IdentityFile ~/.ssh/tsuru
      Host haru
        Hostname 100.73.192.45
        User notoh
        IdentityFile ~/.ssh/haru
      Host kaze
        Hostname 100.69.79.81
        User notoh
        IdentityFile ~/.ssh/kaze
      Host basegbot
        HostName 100.83.81.116
        User basegbot
        IdentityFile ~/.ssh/basegbot
      Host rpi4
        Hostname 100.92.145.147
        User notoh
        IdentityFile ~/.ssh/rpi4
      Host rennypaste
        Hostname 5.78.112.206
        User notohh
        IdentityFile ~/.ssh/renny-key
      Host pve
        Hostname 100.115.234.69
        User root
      Host truenas
        Hostname 192.168.1.199
        User root
        IdentityFile ~/.ssh/truenas
      Host git.flake.sh
        Hostname git.flake.sh
        User notohh
        IdentityFile ~/.ssh/notohh-git
        Port 2222
      Host github.com
        Hostname github.com
        User notohh
        IdentityFile ~/.ssh/notohh-git
    '';
  };
}
