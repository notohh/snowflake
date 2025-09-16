{ pkgs, ... }:
{
  systemd.user.startServices = "sd-switch";
  programs.home-manager.enable = true;

  imports = [
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
      navi
      comma
    ];
    stateVersion = "23.05";
  };
}
