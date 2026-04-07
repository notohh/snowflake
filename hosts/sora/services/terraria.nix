_: {
  networking.firewall.allowedTCPPorts = [ 7777 ];
  virtualisation.oci-containers.containers = {
    # terraria-modded = {
    #   image = "jacobsmile/tmodloader1.4@sha256:80767f7b8b635fb940c030d50ccedb207da61d69f0c56d481d20b92dd60d6d0a";
    #   ports = [ "7777:7777" ];
    #   volumes = [ "/var/lib/terraria/tmodloader:/data" ];
    #   environment = {
    #     TMOD_MOTD = "forsen";
    #     TMOD_PASS = "forsen";
    #     TMOD_AUTOSAVE_INTERVAL = "10";
    #     TMOD_SHUTDOWN_MESSAGE = "Server is shutting down NOW!";
    #     TMOD_AUTODOWNLOAD = "";
    #     TMOD_ENABLEDMODS = "";
    #     TMOD_MAXPLAYERS = "10";
    #     TMOD_WORLDNAME = "forsen";
    #     TMOD_WORLDSIZE = "2";
    #     TMOD_DIFFICULTY = "2";
    #     TMOD_NPCSTREAM = "60";
    #     TMOD_WORLDSEED = "feahjwfghwjiopfg";
    #     TMOD_LANGUAGE = "en-US";
    #     TMOD_UPNP = "1";
    #   };
    # };
    terraria-vanilla = {
      image = "passivelemon/terraria-docker@sha256:d60f280522d6c71079638b5036bdd6c4ac9f93c9f3250477ddb345fc2c6933f3";
      ports = [ "7777:7777" ];
      volumes = [ "/var/lib/terraria-vanilla:/opt/terraria/config/" ];
      environment = {
        AUTOCREATE = "2";
        DIFFICULTY = "2";
        SECURE = "false";
        UPNP = "true";
      };
    };
  };
}
