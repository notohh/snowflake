{pkgs, ...}: {
  imports = [
    ../../services
    ../../programs/anyrun
    ../../programs/browsers/firefox
    ../../programs/browsers/chromium
    ../../programs/terminal/wezterm
    ../../programs/terminal/zellij
    # ../../programs/themes.nix
    ../../programs/media/cava.nix
    ../../programs/mako.nix
    ../../programs/media/zathura.nix
  ];

  home.packages = with pkgs; [
    discord
    pavucontrol
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
    wl-clipboard
    swww
    hyprpicker
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
