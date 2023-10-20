inputs: {
  nodes = with inputs.deploy-rs.lib.x86_64-linux; {
    sakura = {
      hostname = "sakura";
      profiles.system = {
        user = "root";
        path = activate.nixos inputs.self.nixosConfigurations.sakura;
      };
      sshUser = "root";
      sshOpts = ["-t" "-i" "~/.ssh/sakura"];
      magicRollback = true;
    };
    kariru = {
      hostname = "kariru";
      profiles.system = {
        user = "root";
        path = activate.nixos inputs.self.nixosConfigurations.kariru;
      };
      sshUser = "root";
      sshOpts = ["-t" "-i" "~/.ssh/kariru"];
      magicRollback = true;
    };
    yuki = {
      hostname = "yuki";
      profiles.system = {
        user = "root";
        path = activate.nixos inputs.self.nixosConfigurations.yuki;
      };
      sshUser = "root";
      sshOpts = ["-t" "-i" "~/.ssh/yuki"];
      magicRollback = true;
    };
    arashi = {
      hostname = "arashi";
      profiles.system = {
        user = "root";
        path = activate.nixos inputs.self.nixosConfigurations.arashi;
      };
      sshUser = "root";
      sshOpts = ["-t" "-i" "~/.ssh/arashi"];
      magicRollback = true;
    };
    sora = {
      hostname = "sora";
      profiles.system = {
        user = "root";
        path = activate.nixos inputs.self.nixosConfigurations.sora;
      };
      sshUser = "root";
      sshOpts = ["-t" "-i" "~/.ssh/kumo"];
      magicRollback = true;
    };
    tsuru = {
      hostname = "tsuru";
      profiles.system = {
        user = "root";
        path = activate.nixos inputs.self.nixosConfigurations.tsuru;
      };
      sshUser = "root";
      sshOpts = ["-t" "-i" "~/.ssh/tsuru"];
      magicRollback = true;
    };
  };
}
