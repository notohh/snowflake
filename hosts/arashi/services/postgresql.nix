{
  pkgs,
  lib,
  ...
}: {
  networking.firewall.allowedTCPPorts = [5432];
  services.postgresql = {
    enable = true;
    enableTCPIP = true;
    package = pkgs.postgresql_14;
    port = 5432;
    settings = {
      listen_addresses = lib.mkForce "*";
    };
    authentication = ''
      local all all trust
      host replication all 127.0.0.1/32 trust
      host all all all trust
    '';
    ensureUsers = [
      {
        name = "postgres";
        ensurePermissions = {
          "ALL TABLES IN SCHEMA public" = "ALL PRIVILEGES";
        };
      }
      {
        name = "hedgedoc";
        ensurePermissions."DATABASE hedgedoc" = "ALL PRIVILEGES";
      }
      {
        name = "forgejo";
        ensurePermissions."DATABASE forgejo" = "ALL PRIVILEGES";
      }
      {
        name = "miniflux";
        ensurePermissions."DATABASE miniflux" = "ALL PRIVILEGES";
      }
      {
        name = "grafana";
        ensurePermissions."DATABASE grafana" = "ALL PRIVILEGES";
      }
      {
        name = "authelia";
        ensurePermissions."DATABASE authelia" = "ALL PRIVILEGES";
      }
    ];
    ensureDatabases = [
      "forgejo"
      "hedgedoc"
      "miniflux"
      "grafana"
      "authelia"
    ];
  };
}
