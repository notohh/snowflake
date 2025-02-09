{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.catppuccin.homeManagerModules.catppuccin
    ../../services
    ../../programs/anyrun
    ../../programs/hyprpanel
    ../../programs/browsers/firefox
    ../../programs/terminal/wezterm
    ../../programs/terminal/zellij
    ../../programs/editors/zed
    ../../programs/media/cava.nix
    ../../programs/media/spicetify.nix
    ../../programs/themes.nix
    # ../../programs/opencomposite.nix
    ../../programs/media/zathura.nix
    ../../programs/media/easyeffects.nix
    ../../wayland/hyprland
    ../../wayland/services/hypridle.nix
    ../../wayland/services/hyprpaper.nix
    ../../wayland/programs/hyprlock.nix
  ];
  home.packages = with pkgs; [
    chromium
    discord-canary
    technorino
    obsidian
    vscode-fhs
    signal-desktop
    obs-studio
    pavucontrol
    anki-bin
    virt-manager
    qbittorrent
    miru
    hyprpicker
    imv
    mpv
    ffmpeg
    rustypaste-cli
    gimp
    cryptomator
    ventoy-bin-full
    wine
    bottles
    lutris
    r2modman
    moonlight-qt
    tokei
    jellyfin-media-player
    jellyfin-rpc
    wlx-overlay-s
    losslesscut-bin
    mangohud
    uxplay
    drawio
    inputs.zen.packages.${pkgs.system}.default
    inputs.nix-gaming.packages.${pkgs.system}.osu-lazer-bin
    inputs.flocon.packages.${pkgs.system}.bolt-launcher
    inputs.manga-tui.packages.${pkgs.system}.manga-tui
    inputs.prismlauncher.packages.${pkgs.system}.prismlauncher
    # inputs.hyprsunset.packages.${pkgs.system}.default
  ];
  catppuccin = {
    enable = true;
    flavor = "mocha";
    accent = "pink";
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
