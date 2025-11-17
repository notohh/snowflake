{ config, ... }:
{
  sops.secrets = {
    romm-env = { };
  };
  virtualisation.oci-containers.containers =
    let
      rommDir = "/var/lib/romm";
    in
    {
      romm = {
        image = "rommapp/romm@sha256:1895c339b3c7ca62d52f809f5e4c747d78fc8291ea5ee88b3b57df84acf33449";
        ports = [ "8080:8080" ];
        environmentFiles = [ config.sops.secrets.romm-env.path ];
        environment = {
          ROMM_DB_DRIVER = "postgresql";
          DB_HOST = "192.168.1.211";
          DB_PORT = "5432";
          DB_NAME = "romm";
          DB_USER = "romm";
        };
        volumes = [
          "${rommDir}/resources:/romm/resources"
          "${rommDir}/redis-data:/redis-data"
          "${rommDir}/library:/romm/library"
          "${rommDir}/assets:/romm/assets"
          "${rommDir}/config:/romm/config"
        ];
        extraOptions = [ "--network=host" ];
      };
    };
}
