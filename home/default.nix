{pkgs, ...}: {
  imports = [
    ./neofetch
    ./nushell
    ./starship
    ./helix
    ./git
    ./lazygit
    ./direnv
    ./bat
  ];

  home.packages = with pkgs; [
    wget
    croc
    eza
    eva
    fd
    du-dust
    bottom
    gnupg
    ripgrep
    lazydocker
    yt-dlp
    nfs-utils
    dig
    tailspin
    nitch
    joshuto
  ];

  services.gpg-agent = {
    enable = true;
    defaultCacheTtl = 3600;
    pinentryFlavor = "curses";
    enableSshSupport = true;
    enableNushellIntegration = true;
  };

  programs.ssh = {
    enable = true;
    extraConfig = ''
      Host sakura
        HostName 100.121.201.47
        User notoh
        IdentityFile ~/.ssh/sakura
      Host kariru
        HostName 100.126.229.95
        User notoh
        IdentityFile ~/.ssh/kariru
      Host yuki
        HostName 100.108.113.89
        User notoh
        IdentityFile ~/.ssh/yuki
      Host arashi
        HostName 100.94.214.100
        User notoh
        IdentityFile ~/.ssh/arashi
      Host sora
        HostName 100.104.42.96
        User notoh
        IdentityFile ~/.ssh/sora
      Host daphbot
        Hostname 100.109.118.139
        User root
        IdentityFile ~/.ssh/daphbot
      Host tsuru
        HostName 100.82.146.40
        User notoh
        IdentityFile ~/.ssh/tsuru
      Host haru
        HostName 100.73.192.45
        User notoh
        IdentityFile ~/.ssh/haru
      Host basegbot
        HostName 100.83.81.116
        User basegbot
        IdentityFile ~/.ssh/basegbot
      Host pihole
        HostName 192.168.1.221
        User notoh
        IdentityFile ~/.ssh/pihole
      Host rpi4
        HostName 100.92.145.147
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

  programs.zoxide = {
    enable = true;
    enableNushellIntegration = true;
    options = [
      "--cmd cdd"
    ];
  };
}
