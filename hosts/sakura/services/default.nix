{...}: {
  imports = [
    ./traefik.nix
    ./hugo.nix
    ./foundryvtt.nix
    ./forgejo.nix
    ./jellyfin.nix
    ./rustypaste.nix
    ./woodpecker.nix
    ./hedgedoc.nix
    ./dashdot.nix
    ./grafana.nix
    ./prometheus.nix
  ];
}
