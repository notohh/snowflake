{...}: {
  imports = [
    ./traefik.nix
    ./homepage.nix
    ./searxng.nix
    ./hugo.nix
    ./stash.nix
    ./foundryvtt.nix
    ./forgejo.nix
  ];
}
