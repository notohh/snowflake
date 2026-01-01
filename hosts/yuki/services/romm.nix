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
        image = "rommapp/romm@sha256:dc3ecc73445d6258ceaea621881544dd6aa98dd5853f8f39dac967e3a70fcb78"; # 4.5.0-beta.3
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
