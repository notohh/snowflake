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
    ./btop
    ./bat
  ];

  home.packages = with pkgs; [
    croc
    exa
    gdu
    ripgrep
    lazydocker
    yt-dlp
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
      Host pihole
        Hostname 192.168.1.221
        User root
      Host pve1
        Hostname 192.168.1.36
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
