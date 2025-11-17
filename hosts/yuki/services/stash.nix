{ pkgs, ... }:
let
  storagePath = "/var/lib/stash";
in
{
  environment.systemPackages = [ pkgs.gallery-dl ];
  virtualisation.oci-containers.containers.stash = {
    image = "stashapp/stash@sha256:a62f2d8afadbe029403777d18f54b2455b209a223aa28c6d3985c3cf9df2e08a"; # v0.29.3
    ports = [ "9999:9999" ];
    environment = {
      STASH_STASH = "/data/";
      STASH_GENERATED = "/generated/";
      STASH_METADATA = "/metadata/";
      STASH_CACHE = "/cache/";
      STASH_PORT = "9999";
    };
    volumes = [
      "/etc/localtime:/etc/localtime:ro"
      "/stash-media:/data"
      "${storagePath}/.config:/root/.stash"
      "${storagePath}/.metadata:/metadata"
      "${storagePath}/cache:/cache"
      "${storagePath}/generated:/generated"
      "${storagePath}/blobs:/blobs"
    ];
  };
}
