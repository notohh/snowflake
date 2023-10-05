{...}: {
  imports = [
    ./traefik.nix
    ./authelia.nix
    ./forgejo.nix
    ./rustypaste.nix
    ./woodpecker.nix
    ./hedgedoc.nix
    ./dashdot.nix
    ./grafana.nix
    ./vaultwarden.nix
    ./conduit.nix
    ./cloudflareddns.nix
  ];
}
