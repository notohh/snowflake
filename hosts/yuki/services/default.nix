{...}: {
  imports = [
    ./restic.nix
    ./traefik.nix
    ./stash.nix
    ./searxng.nix
    ./homarr.nix
    ./dashdot.nix
    ./jellyfin.nix
    ./forgejo-runners.nix
    ./minecraft.nix
  ];
}
