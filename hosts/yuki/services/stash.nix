_: let
  storagePath = "/home/notoh/docker/stash";
in {
  virtualisation.oci-containers.containers.stash = {
    image = "stashapp/stash@sha256:067b4b244c0521421ebcaca49ebd6f4a3e6d837336f22f52ded4e82db1ba8538"; # v0.25.0
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
