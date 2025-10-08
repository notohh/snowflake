_: {
  virtualisation.oci-containers.containers.twitch-miner = {
    image = "rdavidoff/twitch-channel-points-miner-v2@sha256:03a46627173caab35afeba99451f55bb74229a732ccbf8458d3aa5016503d5cd"; # 2.0.0
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
