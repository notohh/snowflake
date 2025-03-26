_: {
  services.hedgedoc = {
    enable = true;
    settings = {
      port = 3300;
      domain = "scratch.flake.sh";
      host = "100.121.201.47";
      allowOrigin = ["scratch.flake.sh"];
      allowAnonymous = true;
      allowFreeURL = true;
      allowEmailRegister = false;
      dbURL = "postgres://hedgedoc:hedgedoc@192.168.1.211:5432/hedgedoc";
    };
  };
}
