_: {
  networking.firewall.allowedTCPPorts = [4800];

  sops.secrets.ganymede-auth = {};
  virtualisation.oci-containers.containers = {
    ganymede = {
      hostname = "ganymede";
      image = "ghcr.io/zibbp/ganymede@sha256:3f7a93e4875b665cd6473cea99f35fc790facd1f6cfed7c3e6c34c65a405727f"; # 4.0.3
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
