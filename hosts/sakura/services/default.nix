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
    ./immich-proxy.nix
    ./hedgedoc.nix
    ./copyparty.nix
  ];
}
