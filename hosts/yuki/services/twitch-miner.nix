_: {
  virtualisation.oci-containers.containers.twitch-miner = {
    image = "rdavidoff/twitch-channel-points-miner-v2@sha256:a344037ff4180fccc909ca398cc180a840ffd89f6af121789a58764a86769e58";
    volumes = [
      "/home/notoh/twitch-miner/analytics:/usr/src/app/analytics"
      "/home/notoh/twitch-miner/cookies:/usr/src/app/cookie"
      "/home/notoh/twitch-miner/logs:/usr/src/app/logs"
      "/home/notoh/twitch-miner/run.py:/usr/src/app/run.py:ro"
    ];
    ports = ["5000:5000"];
  };
}
