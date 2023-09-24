_: {
  networking.firewall.allowedTCPPorts = [8080];
  networking.firewall.allowedUDPPorts = [52000 52100];
  virtualisation.oci-containers.containers.neko = {
    image = "m1k1o/neko:firefox";
    ports = [
      "8080:8080"
      "52000-52100:52000-52100/udp"
    ];
    environment = {
      NEKO_SCREEN = "1920x1080@60";
      NEKO_PASSWORD = "forsen";
      NEKO_EPR = "52000-52100";
      NEKO_NAT1TO1 = "100.110.140.130";
      NEKO_BIND = "0.0.0.0:8080";
      NEKO_CONTROL_PROTECTION = "true";
      NEKO_VIDEO_CODEC = "h264";
      NEKO_ICELITE = "true";
      NEKO_ICESERVER = "stun:stun.l.google.com:19302";
    };
  };
}
