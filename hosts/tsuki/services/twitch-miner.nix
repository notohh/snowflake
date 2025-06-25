_: {
  virtualisation.oci-containers.containers.twitch-miner = {
    image = "rdavidoff/twitch-channel-points-miner-v2@sha256:abf28a9118635382b42ea52d223389bee10025dee6fd86606df0d27ba8f39ce1";
    hostname = "twitch-miner";
    volumes = [
      "/home/notoh/twitch-miner/analytics:/usr/src/app/analytics"
      "/home/notoh/twitch-miner/cookies:/usr/src/app/cookies"
      "/home/notoh/twitch-miner/logs:/usr/src/app/logs"
      "/home/notoh/twitch-miner/run.py:/usr/src/app/run.py:ro"
    ];
    ports = ["5000:5000"];
  };
}
