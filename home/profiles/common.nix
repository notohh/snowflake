{pkgs, ...}: {
  imports = [
    ../programs/helix
    ../programs/lazygit
    ../programs/neofetch
    ../programs/nushell
    ../programs/yazi
    ../programs/atuin.nix
    ../programs/bat.nix
    ../programs/direnv.nix
    ../programs/git.nix
    ../programs/starship.nix
    ../programs/zoxide.nix
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
    procs
  ];
}
