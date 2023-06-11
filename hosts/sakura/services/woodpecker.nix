{config, ...}: {
  sops.secrets.woodpecker-server = {};
  services.woodpecker-server = {
    enable = true;
    environment = {
      WOODPECKER_SERVER_ADDR = ":8006";
      WOODPECKER_HOST = "https://ci.notohh.dev";
      WOODPECKER_OPEN = "false";
      WOODPECKER_GITEA = "true";
      WOODPECKER_GITEA_URL = "https://git.notohh.dev";
      WOODPECKER_ADMIN = "notohh";
    };
    environmentFile = config.sops.secrets.woodpecker-server.path;
  };

  services.woodpecker-agents.agents.nix = {
    enable = true;
  };
}
