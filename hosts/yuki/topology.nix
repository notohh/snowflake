_: {
  topology = {
    self = {
      name = "yuki";
      hardware.info = "Proxmox VM";
      interfaces = {
        tailscale0 = {
          addresses = [ "100.108.113.89/32" ];
          network = "tailscale0";
          type = "wireguard";
        };
        home = {
          addresses = [ "192.168.1.98/24" ];
          network = "home";
          type = "ethernet";
        };
      };
    };
  };
}
