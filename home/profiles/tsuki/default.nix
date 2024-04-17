{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.hyprland.homeManagerModules.default
    inputs.anyrun.homeManagerModules.default
    inputs.ags.homeManagerModules.default
    inputs.hypridle.homeManagerModules.default
    inputs.hyprlock.homeManagerModules.default
    inputs.nix-index-database.hmModules.nix-index
    ../../services
    ../../programs/ags
    ../../programs/anyrun
    ../../programs/browsers/firefox
    ../../programs/browsers/chromium
    ../../programs/terminal/wezterm
    ../../programs/terminal/zellij
    ../../programs/gtk.nix
    ../../programs/media/cava.nix
    ../../programs/mako.nix
    ../../programs/media/spotify-player.nix
    ../../programs/media/zathura.nix
    ../../wayland/hyprland
    ../../wayland/services/hypridle.nix
    ../../wayland/programs/hyprlock.nix
  ];

  home.packages = with pkgs; [
    discord
    signal-desktop
    thunderbird
    obs-studio
    pavucontrol
    anki-bin
    tomato-c
    distrobox
    gpg-tui
    vscode-fhs
    obsidian-wayland
    jellyfin-mpv-shim
    virt-manager
    qbittorrent
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
    stellarium
    inputs.nix-gaming.packages.${pkgs.system}.osu-lazer-bin
    (libsForQt5.callPackage ../../../pkgs/chatterino7 {})
    (callPackage ../../../pkgs/jellyfin-rpc {})
  ];

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
