{...}: {
  imports = [
    ./restic.nix
    ./traefik.nix
    ./stash.nix
    ./homarr.nix
    ./dashdot.nix
    ./jellyfin.nix
    ./minecraft.nix
  ];
}
