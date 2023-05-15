{pkgs, ...}: {
  imports = [
    ./neofetch
    ./nushell
    ./starship
    ./helix
    ./git
    ./lazygit
    ./zoxide
    ./direnv
  ];

  home.packages = with pkgs; [
    bat
    croc
    lazydocker
    yt-dlp
  ];

  programs.ssh = {
    enable = true;
    extraConfig = ''
      Host hime
        HostName 192.168.1.66
        User oh
        IdentityFile /home/notoh/.ssh/hime
      Host sutakku
        HostName 192.168.1.72
        User oh
        IdentityFile /home/notoh/.ssh/sutakku
      Host sakura
        HostName 192.168.1.25
        User notoh
        IdentityFile /home/notoh/.ssh/sakura
      Host pihole
        Hostname 192.168.1.221
        User root
      Host pve1
        Hostname 192.168.1.36
        User root
    '';
  };
}
