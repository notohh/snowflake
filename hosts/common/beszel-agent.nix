_: {
  sops.secrets.beszel-agent-token = {
    owner = "beszel-agent";
  };
  services.beszel.agent = {
    enable = true;
    smartmon.enable = true;
    openFirewall = true;
    environment = {
      DISABLE_SSH = "false";
      HUB_URL = "100.108.113.89";
      LISTEN = "0.0.0.0:45876";
      KEY = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIbMTB+RvVeTI24NvoAwNLa9DvnG6Wk9LIqCNMyEKGZg";
      TOKEN_FILE = "/run/secrets/beszel-agent-token";
    };
  };
}
