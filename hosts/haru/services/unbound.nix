_: {
  services.unbound = {
    enable = true;
    resolveLocalQueries = false;
    enableRootTrustAnchor = true;
    settings = {
      server = {
        verbosity = 0;
        interface = "0.0.0.0";
        port = 5335;
        do-ip4 = true;
        do-udp = true;
        do-tcp = true;
        harden-glue = true;
        harden-dnssec-stripped = true;
        use-caps-for-id = false;
        edns-buffer-size = 1232;
        prefetch = true;
        num-threads = 2;
        so-rcvbuf = "1m";
        access-control = [
          "10.0.0.0/8 allow"
          "172.16.0.0/12 allow"
          "192.168.0.0/16 allow"
        ];
        private-address = [
          "192.168.0.0/16"
          "169.254.0.0/16"
          "172.16.0.0/12"
          "10.0.0.0/8"
          "fd00::/8"
          "fe80::/10"
        ];
      };
    };
  };
}
