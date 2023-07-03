{...}: {
  imports = [
    ./traefik.nix
    ./authelia.nix
    ./atticd.nix
    ./hugo.nix
    ./forgejo.nix
    ./jellyfin.nix
    ./rustypaste.nix
    ./woodpecker.nix
    ./hedgedoc.nix
    ./dashdot.nix
    ./grafana.nix
  ];
}
