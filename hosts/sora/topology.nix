_: {
  topology = {
    self = {
      name = "sora";
      hardware.info = "Hetzner VPS";
      interfaces = {
        tailscale0 = {
          addresses = [ "100.104.42.96/32" ];
          network = "tailscale0";
          type = "wireguard";
        };
        eth0 = {
          network = "hetzner";
          type = "ethernet";
        };
      };
    };
  };
}
