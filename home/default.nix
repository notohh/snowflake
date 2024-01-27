{pkgs, ...}: {
  imports = [
    ./editors/helix
    ./editors/neovim
    ./neofetch
    ./nushell
    ./starship
    ./git
    ./lazygit
    ./direnv
    ./yazi
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
    unzip
    unrar
    p7zip
  ];

  services.gpg-agent = {
    enable = true;
    defaultCacheTtl = 3600;
    pinentryFlavor = "curses";
    enableSshSupport = true;
    enableNushellIntegration = true;
  };

  programs.bat.enable = true;

  programs.zoxide = {
    enable = true;
    enableNushellIntegration = true;
    options = [
      "--cmd cdd"
    ];
  };
}
