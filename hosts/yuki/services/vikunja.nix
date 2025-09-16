_: {
  networking.firewall.allowedTCPPorts = [ 3456 ];
  services.vikunja = {
    enable = true;
    frontendScheme = "https";
    frontendHostname = "100.108.113.89";
    settings = {
      redis = {
        enabled = true;
        host = "192.168.1.211:6380";
        password = "vikunja";
      };
    };
    database = {
      type = "postgres";
      host = "192.168.1.211";
      database = "vikunja";
    };
  };
}
