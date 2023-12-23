_: {
  sops.secrets.neko-admin = {};
  networking.firewall.allowedTCPPorts = [8085];
  networking.firewall.allowedUDPPorts = [52000 52100];
  virtualisation.oci-containers.containers.neko = {
    image = "m1k1o/neko:firefox";
    ports = [
      "8085:8080"
      "52000-52100:52000-52100/udp"
    ];
    environment = {
      NEKO_SCREEN = "1600x900@60";
      NEKO_PASSWORD = "forsen";
      NEKO_EPR = "52000-52100";
      NEKO_NAT1TO1 = "5.161.102.107";
      NEKO_CONTROL_PROTECTION = "true";
      NEKO_VIDEO_CODEC = "vp8";
    };
    environmentFiles = [
      /run/secrets/neko-admin
    ];
  };
}
