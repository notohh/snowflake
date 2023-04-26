inputs: {
  nodes = with inputs.deploy-rs.lib.x86_64-linux; {
    hime = {
      hostname = "hime";
      profiles.system = {
        user = "root";
        path = activate.nixos inputs.self.nixosConfigurations.hime;
      };
      sshOpts = ["-i" "/etc/ssh/ssh_host_ed25519_key"];
      sshUser = "root";
    };
  };
 }