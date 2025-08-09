{pkgs, ...}: {
  networking.firewall.allowedUDPPorts = [27960];
  services.redis = {
    package = pkgs.valkey;
    servers = {
      minqlx = {
        enable = true;
        openFirewall = true;
        port = 6379;
        bind = "100.104.42.96";
        databases = 1;
        logLevel = "debug";
        requirePass = "minqlx";
        settings = {
          protected-mode = "no";
        };
      };
    };
  };
  virtualisation.oci-containers.containers.quakelive = {
    image = "jamesla/quakelive:latest";
    ports = ["27960:27960/udp"];
    environment = {
      ACCESS = ''
        76561198058253495|admin
      '';
      SERVER_CFG = ''
        set serverstartup "startrandommap"
        set sv_maxClients "12"
        set g_password "forsen"
        set g_floodprot_maxcount "10"
        set g_floodprot_decay "1000"
        set g_itemTimers "0"
        set sv_hostname "quake gooners"
        set sv_tags "Dedicated, private, glhf, forsen"
        set sv_floodprotect "10"
        set sv_idleExit "120"
        set qlx_owner "76561198058253495"
        set qlx_redisAddress "100.104.42.96"
        set qlx_database "Redis"
        set qlx_redisPassword "minqlx"
        set qlx_setmotd "forsen"
        set qlx_plugins "balance, plugin_manager, essentials, motd, permission, ban, silence, clan, log, fun, names"
        set com_hunkMegs "90"
      '';
      MAP_POOL = ''
        campgrounds|duel
        campgrounds|ffa
        battleforged|duel
        battleforged|ffa
        aerowalk|duel
        aerowalk|ffa
        toxicity|duel
        toxicity|ffa
        sinister|duel
        sinister|ffa
        hektik|duel
        elder|duel
        elder|ffa
        cure|duel
        cure|ffa
        bloodrun|duel
        bloodrun|ffa
        houseofdecay|duel
        houseofdecay|ffa
        lostworld|duel
        lostworld|ffa
        furiousheights|duel
        furiousheights|ffa
      '';
    };
  };
}
