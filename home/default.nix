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
    exa
    eva
    du-dust
    bottom
    gnupg
    gping
    ripgrep
    lazydocker
    yt-dlp
    cachix
    nfs-utils
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
        HostName 192.168.1.25
        User notoh
        IdentityFile ~/.ssh/sakura
      Host kariru
        HostName 192.168.1.54
        User notoh
        IdentityFile ~/.ssh/kariru
      Host yuki
        HostName 192.168.1.36
        User notoh
        IdentityFile ~/.ssh/yuki
      Host arashi
        HostName 192.168.1.211
        User notoh
        IdentityFile ~/.ssh/arashi
      Host sora
        HostName 5.161.181.184
        User notoh
        IdentityFile ~/.ssh/kumo
      Host pihole
        Hostname 192.168.1.221
        User root
      Host pve
        Hostname 192.168.1.37
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
