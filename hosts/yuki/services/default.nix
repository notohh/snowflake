{...}: {
  imports = [
    ./traefik.nix
    ./stash.nix
    ./jellyfin.nix
    ./wallos.nix
    ./homepage.nix
  ];
}
