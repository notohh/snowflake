_: {
  virtualisation.oci-containers.containers.twitch-miner = {
    image = "rdavidoff/twitch-channel-points-miner-v2@sha256:f160a2e6fd2a558d28c929552fb0992a12a37564a035d9bcec5ffaf76f5fcd05"; # 2.0.4
    hostname = "twitch-miner";
    volumes = [
      "/home/notoh/twitch-miner/analytics:/usr/src/app/analytics"
      "/home/notoh/twitch-miner/cookies:/usr/src/app/cookies"
      "/home/notoh/twitch-miner/logs:/usr/src/app/logs"
      "/home/notoh/twitch-miner/run.py:/usr/src/app/run.py:ro"
    ];
    ports = [ "5000:5000" ];
  };
}
