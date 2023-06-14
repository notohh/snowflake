{...}: {
  imports = [
    ./traefik.nix
    ./hugo.nix
    ./foundryvtt.nix
    ./forgejo.nix
    ./jellyfin.nix
    ./rustypaste.nix
    ./grafana.nix
    ./prometheus.nix
    ./woodpecker.nix
    ./atticd.nix
    ./hedgedoc.nix
    ./dashdot.nix
  ];
}
