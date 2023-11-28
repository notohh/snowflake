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
    pinentryFlavor = "gtk2";
    enableSshSupport = true;
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
        HostName 100.110.140.130
        User notoh
        IdentityFile ~/.ssh/yuki
      Host arashi
        HostName 100.94.214.100
        User notoh
        IdentityFile ~/.ssh/arashi
      Host sora
        HostName 100.87.54.48
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
