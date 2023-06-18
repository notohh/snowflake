_: {
  services.hedgedoc = {
    enable = true;
    settings = {
      port = 3300;
      domain = "scratch.notohh.dev";
      allowOrigin = ["scratch.notohh.dev"];
      allowAnonymous = true;
      allowFreeURL = true;
      allowEmailRegister = false;
      dbURL = "postgres://hedgedoc:hedgedoc@192.168.1.211:5432/hedgedoc";
    };
  };
}
