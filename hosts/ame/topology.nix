_: {
  topology = {
    self = {
      name = "ame";
      hardware.info = "Thinkpad T480";
      interfaces = {
        tailscale0 = {
          addresses = [ "100.108.207.106/32" ];
          network = "tailscale0";
          type = "wireguard";
        };
        home = {
          network = "home";
          addresses = [ "" ];
          type = "wifi";
        };
      };
    };
  };
}
