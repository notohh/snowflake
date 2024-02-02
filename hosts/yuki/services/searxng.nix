{
  pkgs,
  config,
  ...
}: {
  sops.secrets.searxng-secret = {};
  networking.firewall.allowedTCPPorts = [8100];
  services.searx = {
    package = pkgs.searxng;
    enable = false;
    runInUwsgi = false;
    environmentFile = config.sops.secrets.searxng-secret.path;
    limiterSettings = {
      botdetection = {
        ip_lists = {
          pass_ip = [
            "192.168.0.0/16"
            "172.16.0.0/12"
            "10.0.0.0/8"
          ];
        };
      };
    };
    settings = {
      general = {
        debug = false;
        instance_name = "SearXNG";
      };
      ui = {
        default_theme = "simple";
        theme_args = {
          simple_style = "dark";
        };
      };
      search = {
        autocomplete = "google";
        safe_search = 0;
        default_lang = "en-US";
      };
      server = {
        port = 8100;
        bind_address = "0.0.0.0";
        secret_key = "@SEARXNG_SECRET@";
        public_instance = false;
        infinite_scroll = true;
      };
      redis = {
        url = "redis://:searxng@100.94.214.100:6380";
      };
    };
  };
}
