_: {
  topology = {
    self = {
      name = "haru";
      hardware.info = "Proxmox VM";
      interfaces = {
        tailscale0 = {
          addresses = [ "100.73.192.45/32" ];
          network = "tailscale0";
          type = "wireguard";
        };
        home = {
          addresses = [ "192.168.1.103/24" ];
          network = "home";
          type = "ethernet";
        };
      };
    };
  };
}
