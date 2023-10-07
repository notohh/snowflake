{pkgs, ...}: {
  imports = [
    ./neofetch
    ./nushell
    ./starship
    ./helix
    ./git
    ./lazygit
    ./lf
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
    gping
    ripgrep
    lazydocker
    yt-dlp
    cachix
    nfs-utils
    dig
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
      Host pve
        Hostname 100.115.234.69
        User root
      Host basegbot
        HostName 100.83.81.116
        User basegbot
        IdentityFile ~/.ssh/basegbot
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
