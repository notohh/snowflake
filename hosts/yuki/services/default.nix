{...}: {
  imports = [
    ./restic.nix
    ./traefik.nix
    ./kanboard.nix
    ./stash.nix
    ./searxng.nix
    ./homarr.nix
    ./dashdot.nix
    ./miniflux.nix
    ./minecraft.nix
  ];
}
