{ ... }:
{
  imports = [
    ./restic.nix
    ./atticd.nix
    ./immich-backup.nix
    ./syncthing.nix
    ./owncast.nix
  ];
}
