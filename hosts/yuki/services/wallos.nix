_: {
  virtualisation.oci-containers.containers.wallos = {
    image = "bellamy/wallos@sha256:1211a7e859bc295ace4aec1e26317ae442b893168aa32bf587f5066f06f0a436"; #v 1.12.1
    ports = ["8282:80"];
    volumes = [
      "/home/notoh/docker/wallos/db:/var/www/html/db"
      "/home/notoh/docker/wallos/logos:/var/www/html/images/uploads/logos"
    ];
    environment = {TZ = "America/New_York";};
  };
}
