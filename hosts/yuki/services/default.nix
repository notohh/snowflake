{...}: {
  imports = [
    ./restic.nix
    ./traefik.nix
    ./stash.nix
    ./searxng.nix
    ./homarr.nix
    ./dashdot.nix
    ./jellyfin.nix
    ./neko.nix
    ./conduit.nix
  ];
}
