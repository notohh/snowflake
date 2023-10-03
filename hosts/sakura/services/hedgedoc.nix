_: {
  services.hedgedoc = {
    enable = true;
    settings = {
      port = 3300;
      domain = "scratch.flake.sh";
      allowOrigin = ["scratch.flake.sh"];
      allowAnonymous = true;
      allowFreeURL = true;
      allowEmailRegister = false;
      dbURL = "postgres://hedgedoc:hedgedoc@192.168.1.211:5432/hedgedoc";
    };
  };
}
