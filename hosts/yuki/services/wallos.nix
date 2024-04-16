_: {
  virtualisation.oci-containers.containers.wallos = {
    image = "bellamy/wallos@sha256:5df1e301c436d1c4eb2cb67d4a30100625af21b2d54a111586ee489597d4418b"; #v 1.20.2
    ports = ["8282:80"];
    volumes = [
      "/home/notoh/docker/wallos/db:/var/www/html/db"
      "/home/notoh/docker/wallos/logos:/var/www/html/images/uploads/logos"
    ];
    environment = {TZ = "America/New_York";};
  };
}
