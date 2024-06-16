{...}: {
  imports = [
    ./hass
    ./homepage
    ./restic.nix
    ./traefik.nix
    ./stash.nix
    ./jellyfin.nix
    ./wallos.nix
    ./searxng.nix
    ./anki-sync-server.nix
    ./paperless.nix
    ./hydroxide.nix
    # ./twitch-miner.nix
    ./botoh.nix
  ];
}
