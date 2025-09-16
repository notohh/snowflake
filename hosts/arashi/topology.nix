_: {
  topology = {
    self = {
      name = "arashi";
      hardware.info = "Proxmox VM";
      interfaces = {
        tailscale0 = {
          addresses = [ "100.94.214.100/32" ];
          network = "tailscale0";
          type = "wireguard";
        };
        home = {
          addresses = [ "192.168.1.211/24" ];
          network = "home";
          type = "ethernet";
        };
      };
    };
  };
}
