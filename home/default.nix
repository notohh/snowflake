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
  ];
}
