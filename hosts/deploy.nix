inputs: {
  nodes = with inputs.deploy-rs.lib.x86_64-linux; {
    hime = {
      hostname = "hime";
      profiles.system = {
        user = "root";
        path = activate.nixos inputs.self.nixosConfigurations.hime;
      };
      sshUser = "oh";
      sshOpts = ["-t"];
      magicRollback = false;
    };
    sutakku = {
      hostname = "sutakku";
      profiles.system = {
        user = "root";
        path = activate.nixos inputs.self.nixosConfigurations.sutakku;
      };
      sshUser = "oh";
      sshOpts = ["-t"];
      magicRollback = false;
    };
  };
}
