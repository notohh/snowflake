{...}: {
  imports = [
    ./restic.nix
    ./authelia.nix
    ./forgejo.nix
    ./rustypaste.nix
    ./hedgedoc.nix
    ./grafana.nix
    ./vaultwarden.nix
    ./conduit.nix
    ./tailscale.nix
    ./justlog.nix
    ./miniflux.nix
  ];
}
