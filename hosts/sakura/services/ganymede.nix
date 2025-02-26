_: {
  networking.firewall.allowedTCPPorts = [4800];

  sops.secrets.ganymede-auth = {};
  virtualisation.oci-containers.containers = {
    ganymede = {
      hostname = "ganymede";
      image = "ghcr.io/zibbp/ganymede@sha256:4654c1aafb98e53a619d24e2ea3b31d231242d7f7753a780931799ac7f6c2d2a"; # 4.0.4
      ports = ["4800:4800"];
      environment = {
        VIDEOS_DIR = "/data/videos";
        TEMP_DIR = "/data/temp";
        TZ = "America/New_York";
        MAX_CHAT_DOWNLOAD_EXECUTIONS = "3";
        MAX_CHAT_RENDER_EXECUTIONS = "2";
        MAX_VIDEO_DOWNLOAD_EXECUTIONS = "2";
        MAX_VIDEO_CONVERT_EXECUTIONS = "3";
        MAX_VIDEO_SPRITE_THUMBNAIL_EXECUTIONS = "2";
      };
      environmentFiles = [
        /run/secrets/ganymede-auth # stores db creds && twitch creds
      ];
      volumes = [
        "/nas/vods:/data/videos"
        "/nas/vods/docker/ganymede:/data/temp"
        "/nas/vods/docker/ganymede/logs:/data/logs"
        "/nas/vods/docker/ganymede/config:/data/config"
      ];
      extraOptions = ["--network=host"];
    };
  };
}
