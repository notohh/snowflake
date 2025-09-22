{ inputs, pkgs, ... }:
{
  systemd.user.startServices = "sd-switch";
  programs.home-manager.enable = true;

  imports = [
    inputs.nix-index-database.homeModules.nix-index
    ./programs/editors/helix
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
    ./programs/tealdeer.nix
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
      ffmpeg
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
  programs.nix-index-database.comma.enable = true;
}
