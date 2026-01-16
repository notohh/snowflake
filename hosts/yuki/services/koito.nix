_: {
  virtualisation.oci-containers.containers.koito = {
    image = "gabehf/koito@sha256:c4148e1f30daa23c2cc4989d012d3789634c61af183ecb8e245a5c27df340be4"; # 0.1.4
    ports = [ "4110:4110" ];
    environment = {
      KOITO_DATABASE_URL = "postgres://koito:koito@192.168.1.211:5432/koito";
      KOITO_ALLOWED_HOSTS = "fm.internal.flake.sh";
      KOITO_CORS_ALLOWED_ORIGINS = "*";
    };
    volumes = [
      "/var/lib/koito:/etc/koito"
    ];
  };
}
