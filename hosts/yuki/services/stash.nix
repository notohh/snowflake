_: let
  storagePath = "/home/notoh/docker/stash";
in {
  virtualisation.oci-containers.containers.stash = {
    image = "stashapp/stash@sha256:28a04a0db254602c60af337e46770544f4b3f3e0cc0772603a673f6424336a61"; # v0.27.2
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
