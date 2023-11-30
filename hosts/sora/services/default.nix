{...}: {
  imports = [
    ./traefik.nix
    ./uptimekuma.nix
    ./gotify.nix
    ./tailscale.nix
    ./neko.nix
  ];
}
