inputs: {
  nodes = with inputs.deploy-rs.lib.x86_64-linux; {
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
    kariru = {
      hostname = "kariru";
      profiles.system = {
        user = "root";
        path = activate.nixos inputs.self.nixosConfigurations.kariru;
      };
      sshUser = "notoh";
      sshOpts = ["-t" "-i" "~/.ssh/kariru"];
      magicRollback = false;
    };
    yuki = {
      hostname = "yuki";
      profiles.system = {
        user = "root";
        path = activate.nixos inputs.self.nixosConfigurations.yuki;
      };
      sshUser = "notoh";
      sshOpts = ["-t" "-i" "~/.ssh/yuki"];
      magicRollback = false;
    };
    arashi = {
      hostname = "arashi";
      profiles.system = {
        user = "root";
        path = activate.nixos inputs.self.nixosConfigurations.arashi;
      };
      sshUser = "notoh";
      sshOpts = ["-t" "-i" "~/.ssh/arashi"];
      magicRollback = false;
    };
  };
}
