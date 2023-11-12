{...}: {
  imports = [
    ./restic.nix
    ./traefik.nix
    ./stash.nix
    ./jellyfin.nix
    ./minecraft.nix
    ./wallos.nix
    ./homepage.nix
    ./glances.nix
  ];
}
