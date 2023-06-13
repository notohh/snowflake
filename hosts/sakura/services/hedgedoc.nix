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
      db = {
        dialect = "sqlite";
        storage = "/var/lib/hedgedoc/db.sqlite";
      };
    };
  };
}
