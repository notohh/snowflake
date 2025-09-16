{
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    ../../services
    ../../programs/walker.nix
    ../../programs/terminal/wezterm
    ../../programs/terminal/zellij
    ../../programs/terminal/television
    ../../programs/media/cava.nix
    ../../programs/media/spicetify.nix
    ../../programs/themes.nix
    ../../programs/openvr.nix
    ../../programs/media/zathura.nix
    ../../programs/media/mpv.nix
    ../../programs/media/jellyfin-mpv-shim.nix
    ../../programs/media/lutris.nix
    ../../wayland/hyprland
    ../../wayland/services/hypridle.nix
    ../../wayland/services/hyprpaper.nix
    ../../wayland/programs/hyprlock.nix
  ];
  home.packages =
    with pkgs;
    let
      inherit (inputs.prismlauncher.packages.${pkgs.system}) prismlauncher;
      zen = inputs.zen.packages.${pkgs.system}.default;
      osu = inputs.nix-gaming.packages.${pkgs.system}.osu-lazer-bin;
      technorino = inputs.technorino.packages.${pkgs.system}.default;
    in
    [
      chromium
      zen
      vscode-fhs
      vscodium-fhs
      (discord-canary.override {
        withOpenASAR = true;
        withVencord = true;
      })
      signal-desktop
      obs-studio
      pwvucontrol
      helvum
      anki-bin
      virt-manager
      qbittorrent
      imv
      rustypaste-cli
      cryptomator
      moonlight-qt
      tokei
      jellyfin-rpc
      losslesscut-bin
      uxplay
      postman
      gale
      bolt-launcher
      tutanota-desktop
      obsidian
      osu
      prismlauncher
      technorino
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
      Host gemu
        Hostname 100.93.189.27
        User notohh
        IdentityFile ~/.ssh/gemu
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
  xdg = {
    configFile."mimeapps.list".force = true;
    mimeApps = {
      enable = true;
      defaultApplications = {
        "x-scheme-handler/discord-409416265891971072" = [ "discord-409416265891971072.desktop" ];
        "x-scheme-handler/discord-402572971681644545" = [ "discord-402572971681644545.desktop" ];
        "x-scheme-handler/discord-696343075731144724" = [ "discord-696343075731144724.desktop" ];
        "x-scheme-handler/http" = [ "zen.desktop" ];
        "x-scheme-handler/https" = [ "zen.desktop" ];
        "x-scheme-handler/chrome" = [ "zen.desktop" ];
        "text/html" = [ "zen.desktop" ];
        "application/x-extension-htm" = [ "zen.desktop" ];
        "application/x-extension-html" = [ "zen.desktop" ];
        "application/x-extension-shtml" = [ "zen.desktop" ];
        "application/xhtml+xml" = [ "zen.desktop" ];
        "application/x-extension-xhtml" = [ "zen.desktop" ];
        "application/x-extension-xht" = [ "zen.desktop" ];
      };
    };
  };
}
