{...}: {
  imports = [
    ./restic.nix
    ./traefik.nix
    ./stash.nix
    ./homarr.nix
    ./dashdot.nix
    ./jellyfin.nix
    ./forgejo-runners.nix
    ./minecraft.nix
  ];
}
