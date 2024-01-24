{config, ...}: {
  sops.secrets.woodpecker-server = {};
  sops.secrets.woodpecker-agent-secret = {};
  services.woodpecker-server = {
    enable = true;
    environment = {
      WOODPECKER_SERVER_ADDR = ":8200";
      WOODPECKER_GRPC_ADDR = ":8300";
      WOODPECKER_HOST = "https://ci.flake.sh";
      WOODPECKER_OPEN = "false";
      WOODPECKER_GITEA = "true";
      WOODPECKER_GITEA_URL = "https://git.flake.sh";
      WOODPECKER_ADMIN = "notohh";
      WOODPECKER_AGENT_SECRET = config.sops.secrets.woodpecker-agent-secret.path;
      WOODPECKER_LOG_LEVEL = "debug";
      WOODPECKER_DEBUG_PRETTY = "true";
      WOODPECKER_KEEPALIVE_MIN_TIME = "10s";
    };
    environmentFile = config.sops.secrets.woodpecker-server.path;
  };

  services.woodpecker-agents.agents.nix = {
    enable = true;
    environment = {
      DOCKER_HOST = "unix:///var/run/docker.sock";
      WOODPECKER_BACKEND = "docker";
      WOODPECKER_SERVER = "localhost:8300";
      WOODPECKER_AGENT_SECRET = config.sops.secrets.woodpecker-agent-secret.path;
      WOODPECKER_LOG_LEVEL = "debug";
      WOODPECKER_DEBUG_PRETTY = "true";
      WOODPECKER_KEEPALIVE_MIN_TIME = "10s";
      WOODPECKER_HEALTHCHECK = "true";
    };
    extraGroups = [
      "docker"
    ];
  };
}
