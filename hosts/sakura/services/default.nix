{...}: {
  imports = [
    ./traefik.nix
    ./hugo.nix
    ./foundryvtt.nix
    ./forgejo.nix
    ./jellyfin.nix
    ./rustypaste.nix
    ./woodpecker.nix
    ./atticd.nix
    ./hedgedoc.nix
    ./dashdot.nix
  ];
}
