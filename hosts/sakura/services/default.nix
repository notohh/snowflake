{ ... }:
{
  imports = [
    ./restic.nix
    ./forgejo.nix
    ./rustypaste.nix
    ./grafana.nix
    ./vaultwarden.nix
    ./tailscale.nix
    ./wastebin.nix
    ./copyparty.nix
    ./syncthing.nix
    ./pocketid.nix
  ];
}
