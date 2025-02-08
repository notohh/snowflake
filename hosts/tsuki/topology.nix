_: {
  topology = {
    self = {
      name = "tsuki";
      hardware.info = "Desktop";
      interfaces = {
        tailscale0 = {
          addresses = ["100.127.30.116/32"];
          network = "tailscale0";
          type = "wireguard";
        };
        home = {
          addresses = ["192.168.1.47/24"];
          network = "home";
          type = "ethernet";
        };
      };
    };
  };
}
