{lib, ...}: {
  networking.firewall.allowedTCPPorts = [6167 8448];
  services.matrix-conduit = {
    enable = true;
    settings = {
      global = {
        address = "0.0.0.0";
        server_name = "matrix.flake.sh";
        allow_registration = true;
        allow_federation = false;
        allow_encryption = true;
        log = "warn";
        max_concurrent_requests = 100;
        max_request_size = 20000000;
        database_backend = "rocksdb";
        enable_lightning_bolt = false;
        trusted_servers = ["matrix.org"];
      };
    };
  };
}
