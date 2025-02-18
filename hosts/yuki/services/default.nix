{...}: {
  imports = [
    ./hass
    ./homepage
    ./restic.nix
    ./traefik.nix
    ./stash.nix
    ./jellyfin.nix
    ./wallos.nix
    ./anki-sync-server.nix
    ./hoarder.nix
    ./immich.nix
    # ./botoh.nix
  ];
}
