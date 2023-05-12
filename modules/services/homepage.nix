{pkgs, ...}: {
  virtualisation.oci-containers.containers.homepage = {
    ports = ["3000:3000"];
    image = "ghcr.io/benphelps/homepage";
    volumes = ["/home/notoh/docker/homepage:/app/config" "/var/run/docker.sock:/var/run/docker.sock:ro"];
  };
}
