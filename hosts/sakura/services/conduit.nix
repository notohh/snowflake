{inputs, ...}: {
  networking.firewall.allowedTCPPorts = [6167 8448];
  services.matrix-conduit = {
    enable = true;
    package = inputs.conduwuit.packages.x86_64-linux.default;
    settings = {
      global = {
        address = "0.0.0.0";
        server_name = "matrix.flake.sh";
        allow_registration = false;
        allow_federation = true;
        allow_encryption = true;
        log = "info";
        max_concurrent_requests = 100;
        max_request_size = 20000000;
        database_backend = "rocksdb";
        enable_lightning_bolt = false;
        trusted_servers = ["matrix.org"];
        url_preview_domain_contains_allowlist = ["*"];
        well_known = {
          client = "https://matrix.flake.sh";
          server = "matrix.flake.sh:443";
        };
      };
    };
  };
}
