_: {
  topology = {
    self = {
      name = "sakura";
      hardware.info = "Proxmox VM";
      interfaces = {
        tailscale0 = {
          addresses = [ "100.121.201.47/32" ];
          network = "tailscale0";
          type = "wireguard";
        };
        home = {
          addresses = [ "192.168.1.25/24" ];
          network = "home";
          type = "ethernet";
        };
      };
    };
  };
}
