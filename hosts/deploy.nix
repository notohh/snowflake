inputs: {
  nodes = with inputs.deploy-rs.lib.x86_64-linux; {
    hime = {
      hostname = "hime";
      profiles.system = {
        user = "root";
        path = activate.nixos inputs.self.nixosConfigurations.hime;
      };
      sshUser = "oh";
      sshOpts = ["-t" "-i" "~/.ssh/hime"];
      magicRollback = false;
    };
    sutakku = {
      hostname = "sutakku";
      profiles.system = {
        user = "root";
        path = activate.nixos inputs.self.nixosConfigurations.sutakku;
      };
      sshUser = "oh";
      sshOpts = ["-t" "-i" "~/.ssh/sutakku"];
      magicRollback = false;
    };
    sakura = {
      hostname = "sakura";
      profiles.system = {
        user = "root";
        path = activate.nixos inputs.self.nixosConfigurations.sakura;
      };
      sshUser = "notoh";
      sshOpts = ["-t" "-i" "~/.ssh/sakura"];
      magicRollback = false;
    };
  };
}
