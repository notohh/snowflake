{...}: {
  imports = [
    ./traefik.nix
    ./authelia.nix
    ./hugo.nix
    ./forgejo.nix
    ./rustypaste.nix
    ./woodpecker.nix
    ./hedgedoc.nix
    ./dashdot.nix
    ./grafana.nix
    ./vaultwarden.nix
  ];
}
