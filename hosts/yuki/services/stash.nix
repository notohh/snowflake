_: let
  storagePath = "/home/notoh/docker/stash";
in {
  virtualisation.oci-containers.containers.stash = {
    image = "stashapp/stash@sha256:645f6c15b079410d50d488dbeb247c92f25534094dad4e15d886e47648b897f7"; # v0.28.1
    ports = ["9999:9999"];
    environment = {
      STASH_STASH = "/data/";
      STASH_GENERATED = "/generated/";
      STASH_METADATA = "/metadata/";
      STASH_CACHE = "/cache/";
      STASH_PORT = "9999";
    };
    volumes = [
      "/etc/localtime:/etc/localtime:ro"
      "${storagePath}/.config:/root/.stash"
      "${storagePath}/data:/data"
      "${storagePath}/.metadata:/metadata"
      "${storagePath}/cache:/cache"
      "${storagePath}/generated:/generated"
      "${storagePath}/blobs:/blobs"
    ];
  };
}
