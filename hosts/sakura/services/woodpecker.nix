{config, ...}: {
  sops.secrets.woodpecker-server = {};
  sops.secrets.woodpecker-agent-secret = {};
  services.woodpecker-server = {
    enable = true;
    environment = {
      WOODPECKER_SERVER_ADDR = ":8200";
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
    environment = {
      DOCKER_HOST = "unix:///var/run/docker.sock";
      WOODPECKER_BACKEND = "docker";
      WOODPECKER_SERVER = "localhost:8200";
      WOODPECKER_AGENT_SECRET = config.sops.secrets.woodpecker-agent-secret.path;
    };
    extraGroups = [
      "docker"
    ];
  };
}
