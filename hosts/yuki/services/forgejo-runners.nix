{
  pkgs,
  config,
  ...
}: {
  sops.secrets.forgejo-runner-token = {};
  services.gitea-actions-runner = {
    package = pkgs.forgejo-actions-runner;
    instances.main = {
      settings = {
        container = {
          network = "host";
        };
      };
      enable = true;
      name = config.networking.hostName;
      url = "https://git.flake.sh";
      token = "gdeEbeUTifa1nK7EfRgBmvm6XRdQE1zZzAatBRSC";
      labels = [
        "debian-latest:docker://node:18-bullseye"
        "ubuntu-latest:docker://node:18-bullseye"
        #"native:host"
      ];
      hostPackages = with pkgs; [
        bash
        curl
        coreutils
        wget
        gitMinimal
      ];
    };
  };
}
