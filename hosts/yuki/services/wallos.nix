_: {
  virtualisation.oci-containers.containers.wallos = {
    image = "bellamy/wallos@sha256:d3846ab980095be55a3c07633cca905bf29505bc63e5d92ad49938f56fd7b9f7";
    ports = [
      "8282:80"
    ];
    volumes = [
      "/home/notoh/docker/wallos/db:/var/www/html/db"
      "/home/notoh/docker/wallos/logos:/var/www/html/images/uploads/logos"
    ];
    environment = {
      TZ = "America/New_York";
    };
  };
}
