{ inputs, ... }:
{
  flake.deploy =
    let
      sshUser = "root";
      sshOpts = [
        "-t"
        "-i"
        "~/.ssh/forgejo"
      ];
    in
    {
      nodes = with inputs.deploy-rs.lib.x86_64-linux; {
        sakura = {
          inherit sshOpts sshUser;
          hostname = "100.121.201.47";
          profiles.system = {
            user = sshUser;
            path = activate.nixos inputs.self.nixosConfigurations.sakura;
          };
          magicRollback = true;
        };
        kariru = {
          inherit sshOpts sshUser;
          hostname = "100.126.229.95";
          profiles.system = {
            user = sshUser;
            path = activate.nixos inputs.self.nixosConfigurations.kariru;
          };
          magicRollback = true;
        };
        yuki = {
          inherit sshOpts sshUser;
          hostname = "100.108.113.89";
          profiles.system = {
            user = sshUser;
            path = activate.nixos inputs.self.nixosConfigurations.yuki;
          };
          magicRollback = true;
        };
        arashi = {
          inherit sshOpts sshUser;
          hostname = "100.94.214.100";
          profiles.system = {
            user = sshUser;
            path = activate.nixos inputs.self.nixosConfigurations.arashi;
          };
          magicRollback = true;
        };
        sora = {
          inherit sshOpts sshUser;
          hostname = "100.104.42.96";
          profiles.system = {
            user = sshUser;
            path = activate.nixos inputs.self.nixosConfigurations.sora;
          };
          magicRollback = true;
        };
        tsuru = {
          inherit sshOpts sshUser;
          hostname = "100.82.146.40";
          profiles.system = {
            user = sshUser;
            path = activate.nixos inputs.self.nixosConfigurations.tsuru;
          };
          magicRollback = true;
        };
        haru = {
          inherit sshOpts sshUser;
          hostname = "100.73.192.45";
          profiles.system = {
            user = sshUser;
            path = activate.nixos inputs.self.nixosConfigurations.haru;
          };
          magicRollback = true;
        };
      };
    };
}
