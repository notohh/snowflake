_: {
  topology = {
    self = {
      name = "kariru";
      hardware.info = "Proxmox VM";
      interfaces = {
        tailscale0 = {
          addresses = [ "100.126.229.95/32" ];
          network = "tailscale0";
          type = "wireguard";
        };
        home = {
          addresses = [ "192.168.1.54/24" ];
          network = "home";
          type = "ethernet";
        };
      };
    };
  };
}
