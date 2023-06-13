{...}: {
  imports = [
    ./restic.nix
    ./traefik.nix
    ./kanboard.nix
    ./stash.nix
  ];
}
