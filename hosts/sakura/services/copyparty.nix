{inputs, ...}: {
  networking.firewall.allowedTCPPorts = [3210 3211];
  sops.secrets = {
    copyparty-passwd = {
      owner = "copyparty";
    };
    copyparty-catsh-passwd = {
      owner = "copyparty";
    };
    copyparty-suki-passwd = {
      owner = "copyparty";
    };
    copyparty-nam-passwd = {
      owner = "copyparty";
    };
  };
  imports = [
    inputs.copyparty.nixosModules.default
  ];
  services.copyparty = {
    enable = true;
    settings = {
      i = "0.0.0.0";
      p = [3210 3211];
      no-robots = true;
      xff-hdr = "x-forwarded-for";
      xff-src = "100.104.42.96";
      rproxy = 1;
      shr = "/shared";
      shr-adm = "suki, notohh, catsh";
      theme = 2;
    };
    accounts = {
      notohh = {
        passwordFile = "/run/secrets/copyparty-passwd";
      };
      catsh = {
        passwordFile = "/run/secrets/copyparty-catsh-passwd";
      };
      suki = {
        passwordFile = "/run/secrets/copyparty-suki-passwd";
      };
      nam = {
        passwordFile = "/run/secrets/copyparty-nam-passwd";
      };
    };
    volumes = {
      "/" = {
        path = "/nas/copyparty/root";
        access = {
          A = ["notohh, catsh"];
          rg = "*";
        };
        flags = {
          fk = 4;
          scan = 60;
          e2d = true;
          d2t = true;
          nohash = "\.iso$";
          v = 3;
        };
      };
      "/suki" = {
        path = "/nas/copyparty/suki";
        access = {
          A = ["suki, notohh, nam"];
        };
        flags = {
          fk = 4;
          scan = 60;
          e2d = true;
          d2t = true;
          v = 3;
        };
      };
    };
    openFilesLimit = 8192;
  };
}
