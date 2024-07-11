_: let
  storagePath = "/home/notoh/docker/stash";
in {
  virtualisation.oci-containers.containers.stash = {
    image = "stashapp/stash@sha256:7e71c17a2ce69305889bb3305b057929066c767037b2415a354f2b7dbeff6013"; # v0.26.2
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
