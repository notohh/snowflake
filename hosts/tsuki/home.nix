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
      chromium
      discord
      cinny-desktop
      thunderbird
      obs-studio
      signal-desktop
      pavucontrol
      vscodium-fhs
      # obsidian
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
      Host basegbot
        HostName 100.83.81.116
        User basegbot
        IdentityFile ~/.ssh/basegbot
      Host git.flake.sh
        Hostname git.flake.sh
        User notohh
        IdentityFile ~/.ssh/notohh-forgejo
        Port 2222
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
    '';
  };

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "x-scheme-handler/discord-409416265891971072" = ["discord-409416265891971072.desktop"];
      "x-scheme-handler/discord-402572971681644545" = ["discord-402572971681644545.desktop"];
      "x-scheme-handler/discord-696343075731144724" = ["discord-696343075731144724.desktop"];
      "x-scheme-handler/http" = ["floorp.desktop"];
      "x-scheme-handler/https" = ["floorp.desktop"];
      "x-scheme-handler/chrome" = ["floorp.desktop"];
      "text/html" = ["floorp.desktop"];
      "application/x-extension-htm" = ["floorp.desktop"];
      "application/x-extension-html" = ["floorp.desktop"];
      "application/x-extension-shtml" = ["floorp.desktop"];
      "application/xhtml+xml" = ["floorp.desktop"];
      "application/x-extension-xhtml" = ["floorp.desktop"];
      "application/x-extension-xht" = ["floorp.desktop"];
    };
  };
}
