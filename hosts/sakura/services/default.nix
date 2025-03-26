{...}: {
  imports = [
    ./restic.nix
    ./forgejo.nix
    ./rustypaste.nix
    ./grafana.nix
    ./vaultwarden.nix
    ./tailscale.nix
    ./rustlog.nix
    ./wastebin.nix
    ./ganymede.nix
    ./immich-proxy.nix
    ./matrix.nix
    ./hedgedoc.nix
  ];
}
