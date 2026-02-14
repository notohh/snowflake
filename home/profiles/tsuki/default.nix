{
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    ./stylix.nix
    ../../services
    ../../programs/vicinae.nix
    ../../programs/terminal/zellij
    ../../programs/terminal/ghostty.nix
    ../../programs/terminal/television
    ../../programs/media/cava.nix
    ../../programs/media/spicetify.nix
    ../../programs/media/zathura.nix
    ../../programs/media/mpv.nix
    ../../programs/media/lutris.nix
    ../../wayland/hyprland
    ../../wayland/programs/hyprlock.nix
  ];
  home.packages =
    with pkgs;
    let
      inherit (pkgs.stdenv.hostPlatform) system;
      inherit (inputs.prismlauncher.packages.${system}) prismlauncher;
      inherit (inputs.awakened-poe-flake.packages.${system}) awakened-poe-trade;
      inherit (inputs.awakened-poe-flake.packages.${system}) exiled-exchange-2;
      inherit (inputs.awww.packages.${system}) awww;
      zen = inputs.zen.packages.${system}.default;
      osu = inputs.nix-gaming.packages.${system}.osu-lazer-tachyon-bin;
      technorino = inputs.technorino.packages.${system}.package;
    in
    [
      discord-canary
      chromium
      zen
      signal-desktop
      pwvucontrol
      anki-bin
      virt-manager
      imv
      rustypaste-cli
      cryptomator
      moonlight-qt
      jellyfin-rpc
      losslesscut-bin
      uxplay
      gale
      bolt-launcher
      osu
      prismlauncher
      technorino
      krita
      music-discord-rpc
      coppwr
      wayscriber
      rusty-path-of-building
      awakened-poe-trade
      exiled-exchange-2
      awww
      wayvr
      fladder
      mumble
    ];
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    matchBlocks."*" = {
      forwardAgent = false;
      addKeysToAgent = "no";
      compression = false;
      serverAliveInterval = 0;
      serverAliveCountMax = 3;
      hashKnownHosts = false;
      userKnownHostsFile = "~/.ssh/known_hosts";
      controlMaster = "no";
      controlPath = "~/.ssh/master-%r@%n:%p";
      controlPersist = "no";
    };
    extraConfig = ''
      Host sakura
        Hostname 100.121.201.47
        User notoh
        IdentityFile ~/.ssh/sakura
        SetEnv TERM=xterm
      Host kariru
        Hostname 100.126.229.95
        User notoh
        IdentityFile ~/.ssh/kariru
        SetEnv TERM=xterm
      Host yuki
        Hostname 100.108.113.89
        User notoh
        IdentityFile ~/.ssh/yuki
        SetEnv TERM=xterm
      Host arashi
        Hostname 100.94.214.100
        User notoh
        IdentityFile ~/.ssh/arashi
        SetEnv TERM=xterm
      Host sora
        Hostname 100.104.42.96
        User notoh
        IdentityFile ~/.ssh/sora
        SetEnv TERM=xterm
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
      Host fishnet
        Hostname 192.168.1.215
        User notoh
        IdentityFile ~/.ssh/fishnet
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
  xdg.mimeApps =
    let
      value =
        let
          zen = inputs.zen.packages.${pkgs.stdenv.hostPlatform.system}.default;
        in
        zen.meta.desktopFileName;

      associations = builtins.listToAttrs (
        map
          (name: {
            inherit name value;
          })
          [
            "application/x-extension-shtml"
            "application/x-extension-xhtml"
            "application/x-extension-html"
            "application/x-extension-xht"
            "application/x-extension-htm"
            "x-scheme-handler/unknown"
            "x-scheme-handler/mailto"
            "x-scheme-handler/chrome"
            "x-scheme-handler/about"
            "x-scheme-handler/https"
            "x-scheme-handler/http"
            "application/xhtml+xml"
            "application/json"
            "text/plain"
            "text/html"
          ]
      );
    in
    {
      enable = true;
      associations.added = associations;
      defaultApplications = associations;
    };
}
