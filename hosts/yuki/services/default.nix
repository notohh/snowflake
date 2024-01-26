{...}: {
  imports = [
    ./hass
    ./restic.nix
    ./traefik.nix
    ./stash.nix
    ./jellyfin.nix
    ./wallos.nix
    ./homepage.nix
    ./searxng.nix
  ];
}
