_: {
  imports = [
    ./restic.nix
    ./traefik.nix
    ./uptimekuma.nix
    ./ntfy-sh.nix
    ./attic.nix
    ./tailscale.nix
    ./croc.nix
    ./redbot.nix

    ### game servers
    # ./terraria.nix
    # ./factorio.nix
    # ./minecraft.nix
    # ./foundryvtt.nix
    ./quakelive.nix
  ];
}
