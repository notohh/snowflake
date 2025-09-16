{ ... }:
{
  imports = [
    ./hass
    ./restic.nix
    ./traefik.nix
    ./stash.nix
    ./jellyfin.nix
    ./wallos.nix
    ./anki-sync-server.nix
    ./immich.nix
    ./glance.nix
    ./vikunja.nix
  ];
}
