{...}: {
  imports = [
    ./restic.nix
    ./traefik.nix
    ./stash.nix
    ./jellyfin.nix
    ./wallos.nix
    ./homepage.nix
    ./glances.nix
  ];
}
