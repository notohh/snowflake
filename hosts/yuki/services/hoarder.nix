{config, ...}: {
  sops.secrets.hoarder = {};
  services.meilisearch = {
    enable = true;
    listenAddress = "0.0.0.0";
  };
  virtualisation.oci-containers.containers = {
    hoarder-web = {
      image = "ghcr.io/hoarder-app/hoarder@sha256:e2156f3de4a1eafc53afb6e682f20857be4449d7e9d24240afe6d9ccd280ed3b";
      ports = ["3000:3000"];
      environment = {
        BROWSER_WEB_URL = "http://localhost:9222";
        DATA_DIR = "/data";
        DISABLE_SIGNUPS = "true";
        MEILI_ADDR = "http://localhost:${toString config.services.meilisearch.listenPort}";
        OCR_LANGS = "eng";
      };
      volumes = ["/var/lib/hoarder:/data"];
      environmentFiles = [/run/secrets/hoarder];
      extraOptions = ["--network=host"];
    };
    hoarder-chrome = {
      image = "gcr.io/zenika-hub/alpine-chrome";
      cmd = [
        "--no-sandbox"
        "--disable-gpu"
        "--disable-dev-shm-usage"
        "--remote-debugging-address=0.0.0.0"
        "--remote-debugging-port=9222"
        "--hide-scrollbars"
      ];
      ports = ["9222:9222"];
      extraOptions = ["--network=host"];
    };
  };
}
