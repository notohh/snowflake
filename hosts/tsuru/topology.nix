_: {
  topology = {
    self = {
      name = "tsuru";
      hardware.info = "Proxmox VM";
      interfaces = {
        tailscale0 = {
          addresses = [ "100.82.146.40/32" ];
          network = "tailscale0";
          type = "wireguard";
        };
        home = {
          addresses = [ "192.168.1.99/24" ];
          network = "home";
          type = "ethernet";
        };
      };
    };
  };
}
