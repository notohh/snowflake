_: {
  virtualisation.oci-containers.containers.wallos = {
    image = "bellamy/wallos@sha256:9f1bbd7f24e2afdac64ff0985ef801d48f63086540a0844fc05727642bb5360a"; # v4.6.0
    ports = [ "8282:80" ];
    volumes = [
      "/home/notoh/docker/wallos/db:/var/www/html/db"
      "/home/notoh/docker/wallos/logos:/var/www/html/images/uploads/logos"
    ];
    environment = {
      TZ = "America/New_York";
    };
  };
}
