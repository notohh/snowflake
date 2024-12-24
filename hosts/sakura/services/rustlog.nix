{lib, ...}: {
  networking.firewall.allowedTCPPorts = [8025 8123];

  systemd.services = {
    docker-rustlog.serviceConfig = {PrivateNetwork = lib.mkForce false;};
  };

  virtualisation.oci-containers.containers = {
    clickhouse = {
      image = "clickhouse/clickhouse-server:latest";
      environment = {
        CLICKHOUSE_DB = "rustlog";
        CLICKHOUSE_HOST = "192.168.1.25";
      };
      extraOptions = ["--network=host"];
      volumes = [
        "/home/notoh/rustlog/clickhouse:/var/lib/clickhouse:rw"
      ];
    };
    rustlog = {
      hostname = "rustlog";
      image = "ghcr.io/boring-nick/rustlog@sha256:1c6ea8c13d8f154557a7430cdc70d3df89b1413a79c15293c73644e572ae0317";
      ports = ["8025:8025"];
      volumes = [
        "/home/notoh/rustlog/config.json:/config.json"
      ];
      dependsOn = ["clickhouse"];
      extraOptions = ["--network=host"];
    };
  };
}
