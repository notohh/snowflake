_: {
  virtualisation.oci-containers.containers.flaresolverr = {
    image = "ghcr.io/flaresolverr/flaresolverr:v3.3.13";
    ports = ["8191:8191"];
    extraOptions = ["--network=host"];
  };
}
