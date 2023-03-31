{
  pkgs,
  ...
}: {
  imports = [
    ./neofetch
    ./nushell
    ./starship
    ./helix
    ./git
    ./lazygit
  ];

  home.packages = with pkgs; [
    bat
    zoxide
    croc
  ];
}