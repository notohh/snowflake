{
  pkgs,
  ...
}: {
  imports = [
    ./home/nushell
    ./home/starship
    ./home/git
    ./home/lazygit
  ];
}