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
  ];

  home.packages = with pkgs; [
    croc
    exa
    ripgrep
    lazydocker
    yt-dlp
    nfs-utils
    pinentry-curses
  ];

  programs.ssh = {
    enable = true;
    extraConfig = ''
      Host sakura
        HostName 192.168.1.25
        User notoh
        IdentityFile /home/notoh/.ssh/sakura
      Host kariru
        HostName 192.168.1.54
        User notoh
        IdentityFile /home/notoh/.ssh/kariru
      Host pihole
        Hostname 192.168.1.221
        User root
      Host pve1
        Hostname 192.168.1.36
        User root
    '';
  };

  programs.bat = {
    enable = true;
    config = {
      theme = "catppuccin-mocha";
    };
    themes = {
      catppuccin-mocha = builtins.readFile (pkgs.fetchFromGitHub {
          owner = "catppuccin";
          repo = "bat";
          rev = "ba4d16880d63e656acced2b7d4e034e4a93f74b1";
          sha256 = "sha256-6WVKQErGdaqb++oaXnY3i6/GuH2FhTgK0v4TN4Y0Wbw=";
        }
        + "/Catppuccin-mocha.tmTheme");
    };
  };

  programs.zoxide = {
    enable = true;
    enableNushellIntegration = true;
    options = [
      "--cmd cdd"
    ];
  };
}
