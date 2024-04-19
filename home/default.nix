{pkgs, ...}: {
  systemd.user.startServices = "sd-switch";
  programs.home-manager.enable = true;

  imports = [
    ./programs/editors/helix
    ./programs/terminal/lazygit
    ./programs/terminal/neofetch
    ./programs/terminal/nushell
    ./programs/terminal/yazi
    ./programs/terminal/atuin.nix
    ./programs/terminal/bat.nix
    ./programs/terminal/bottom.nix
    ./programs/terminal/starship.nix
    ./programs/terminal/zoxide.nix
    ./programs/direnv.nix
    ./programs/git.nix
  ];

  home = {
    username = "notoh";
    homeDirectory = "/home/notoh";
    packages = with pkgs; [
      wget
      croc
      eza
      eva
      fd
      du-dust
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
      procs
    ];
    stateVersion = "23.05";
  };
}
