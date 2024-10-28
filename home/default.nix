{pkgs, ...}: {
  systemd.user.startServices = "sd-switch";
  programs.home-manager.enable = true;

  imports = [
    ./programs/editors/helix
    ./programs/editors/neovim
    ./programs/terminal/lazygit
    ./programs/terminal/nushell
    ./programs/terminal/yazi
    ./programs/terminal/atuin.nix
    ./programs/terminal/bat.nix
    ./programs/terminal/bottom.nix
    ./programs/terminal/starship.nix
    ./programs/terminal/zoxide.nix
    ./programs/terminal/direnv.nix
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
      atac
      navi
    ];
    stateVersion = "23.05";
  };
}
