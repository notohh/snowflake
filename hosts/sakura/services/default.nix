{...}: {
  imports = [
    ./traefik.nix
    ./homepage.nix
    ./searxng.nix
    ./hugo.nix
    ./stash.nix
    ./foundryvtt.nix
    ./forgejo.nix
    ./jellyfin.nix
    ./rustypaste.nix
    ./grafana.nix
    ./prometheus.nix
    ./woodpecker.nix
    ./atticd.nix
  ];
}
