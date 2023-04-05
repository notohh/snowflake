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
    ./zoxide
  ];

  home.packages = with pkgs; [
    bat
    croc
  ];
}