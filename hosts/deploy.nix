inputs: {
  nodes = with inputs.deploy-rs.lib.x86_64-linux; {
    sakura = {
      hostname = "100.121.201.47";
      profiles.system = {
        user = "root";
        path = activate.nixos inputs.self.nixosConfigurations.sakura;
      };
      sshUser = "root";
      sshOpts = ["-t" "-i" "~/.ssh/forgejo"];
      magicRollback = true;
    };
    kariru = {
      hostname = "100.126.229.95";
      profiles.system = {
        user = "root";
        path = activate.nixos inputs.self.nixosConfigurations.kariru;
      };
      sshUser = "root";
      sshOpts = ["-t" "-i" "~/.ssh/forgejo"];
      magicRollback = true;
    };
    yuki = {
      hostname = "100.108.113.89";
      profiles.system = {
        user = "root";
        path = activate.nixos inputs.self.nixosConfigurations.yuki;
      };
      sshUser = "root";
      sshOpts = ["-t" "-i" "~/.ssh/forgejo"];
      magicRollback = true;
    };
    arashi = {
      hostname = "100.94.214.100";
      profiles.system = {
        user = "root";
        path = activate.nixos inputs.self.nixosConfigurations.arashi;
      };
      sshUser = "root";
      sshOpts = ["-t" "-i" "~/.ssh/forgejo"];
      magicRollback = true;
    };
    sora = {
      hostname = "100.104.42.96";
      profiles.system = {
        user = "root";
        path = activate.nixos inputs.self.nixosConfigurations.sora;
      };
      sshUser = "root";
      sshOpts = ["-t" "-i" "~/.ssh/forgejo"];
      magicRollback = true;
    };
    tsuru = {
      hostname = "100.82.146.40";
      profiles.system = {
        user = "root";
        path = activate.nixos inputs.self.nixosConfigurations.tsuru;
      };
      sshUser = "root";
      sshOpts = ["-t" "-i" "~/.ssh/forgejo"];
      magicRollback = true;
    };
    haru = {
      hostname = "100.73.192.45";
      profiles.system = {
        user = "root";
        path = activate.nixos inputs.self.nixosConfigurations.haru;
      };
      sshUser = "root";
      sshOpts = ["-t" "-i" "~/.ssh/forgejo"];
      magicRollback = true;
    };
    kaze = {
      hostname = "100.69.79.81";
      profiles.system = {
        user = "root";
        path = activate.nixos inputs.self.nixosConfigurations.kaze;
      };
      sshUser = "root";
      sshOpts = ["-t" "-i" "~/.ssh/forgejo"];
      magicRollback = true;
    };
  };
}
