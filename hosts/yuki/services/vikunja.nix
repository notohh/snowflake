{pkgs, ...}: {
  networking.firewall.allowedTCPPorts = [3456 6789];

  virtualisation.oci-containers.containers.vikunja = {
    image = "vikunja/api";
    environment = {
      VIKUNJA_SERVICE_FRONTENDURL = "vikunja.home.arpa";
    };
    ports = [
      "3456:3456"
    ];
    volumes = [
      "/home/notoh/docker/vikunja/files:/app/vikunja/files"
    ];
  };

  virtualisation.oci-containers.containers.vikunja-frontend = {
    image = "vikunja/frontend";
    ports = [
      "6789:80"
    ];
    environment = {
      VIKUNJA_API_URL = "http://192.168.1.36:3456/api/v1";
    };
  };
}
