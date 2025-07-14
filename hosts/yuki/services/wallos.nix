_: {
  virtualisation.oci-containers.containers.wallos = {
    image = "bellamy/wallos@sha256:9dd49af3c8839e561aa458411d90074f8d9da434bdd65a8a13657d5d19229f73"; #v3.3.0
    ports = ["8282:80"];
    volumes = [
      "/home/notoh/docker/wallos/db:/var/www/html/db"
      "/home/notoh/docker/wallos/logos:/var/www/html/images/uploads/logos"
    ];
    environment = {TZ = "America/New_York";};
  };
}
