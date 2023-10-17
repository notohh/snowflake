{
  pkgs,
  config,
  ...
}: {
  sops.secrets.searxng-secret = {};
  networking.firewall.allowedTCPPorts = [8100];
  services.searx = {
    package = pkgs.searxng;
    enable = true;
    environmentFile = config.sops.secrets.searxng-secret.path;
    settings = {
      general = {
        debug = false;
        instance_name = "SearXNG flake.sh";
        enable_metrics = false;
        contact_url = "mailto:contact@notohh.dev";
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
        base_url = "https://search.flake.sh/";
        public_instance = true;
        infinite_scroll = true;
      };
      redis = {
        url = "redis://:searxng@100.94.214.100:6380";
      };
    };
  };
}
