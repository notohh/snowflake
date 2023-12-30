{...}: {
  imports = [
    ./traefik.nix
    ./uptimekuma.nix
    ./gotify.nix
    ./tailscale.nix
    ./factorio.nix
    # ./minecraft.nix
    # ./foundryvtt.nix
  ];
}
