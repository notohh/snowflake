{
  pkgs,
  lib,
  ...
}:
{
  networking.firewall.allowedTCPPorts = [ 5432 ];
  services.postgresql = {
    enable = true;
    enableTCPIP = true;
    package = pkgs.postgresql_14;
    settings = {
      listen_addresses = lib.mkForce "*";
      port = 5432;
      max_connections = "300";
      shared_buffers = "80MB";
    };
    authentication = ''
      local all all trust
      host replication all 127.0.0.1/32 trust
      host all all all trust
    '';
    ensureUsers = [
      {
        name = "hedgedoc";
        ensureDBOwnership = true;
      }
      {
        name = "forgejo";
        ensureDBOwnership = true;
      }
      {
        name = "grafana";
        ensureDBOwnership = true;
      }
      {
        name = "authelia";
        ensureDBOwnership = true;
      }
      {
        name = "vaultwarden";
        ensureDBOwnership = true;
      }
      {
        name = "attic";
        ensureDBOwnership = true;
      }
      {
        name = "atuin";
        ensureDBOwnership = true;
      }
      {
        name = "romm";
        ensureDBOwnership = true;
      }
    ];
    ensureDatabases = [
      "forgejo"
      "hedgedoc"
      "grafana"
      "authelia"
      "vaultwarden"
      "attic"
      "atuin"
      "romm"
    ];
  };
  services.postgresqlBackup = {
    enable = true;
    databases = [
      "forgejo"
      "hedgedoc"
      "grafana"
      "authelia"
      "vaultwarden"
      "attic"
      "miniflux"
      "atuin"
      "romm"
    ];
    compression = "zstd";
    compressionLevel = 4;
    startAt = "*-*-* 23:00:00";
  };
}
