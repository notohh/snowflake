_: {
  networking.firewall.allowedTCPPorts = [6167 8448];
  services.matrix-conduit = {
    enable = true;
    settings = {
      global = {
        address = "0.0.0.0";
        server_name = "forsen";
        allow_registration = true;
        allow_federation = true;
        allow_encryption = true;
        trusted_servers = ["matrix.org"];
      };
    };
  };
}
