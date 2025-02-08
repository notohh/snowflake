_: {
  topology = {
    self = {
      name = "kaze";
      hardware.info = "BuyVM VPS";
      interfaces = {
        tailscale0 = {
          addresses = ["100.69.79.81/32"];
          network = "tailscale0";
          type = "wireguard";
        };
        eth0 = {
          network = "hetzner";
          addresses = ["198.98.48.71 "];
          type = "ethernet";
        };
      };
    };
  };
}
