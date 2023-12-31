{
  pkgs,
  config,
  ...
}: {
  sops.secrets.snowflake-runner-token = {};
  sops.secrets.basegbot-runner-token = {};
  services.gitea-actions-runner = {
    package = pkgs.forgejo-actions-runner;
    instances.snowflake = {
      settings = {
        container = {
          network = "host";
        };
      };
      enable = true;
      name = config.networking.hostName;
      token = config.sops.secrets.snowflake-runner-token.path;
      url = "https://git.flake.sh";
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
    instances.basegbot = {
      settings = {
        container = {
          network = "host";
        };
      };
      enable = true;
      name = config.networking.hostName;
      token = config.sops.secrets.basegbot-runner-token.path;
      url = "https://git.flake.sh";
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
    instances.nixgarden = {
      settings = {
        container = {
          network = "host";
        };
      };
      enable = true;
      name = config.networking.hostName;
      token = "ufM3x5MANdcIg9qb7LTJrC7dAi9Kw6DmVXDDX3HL";
      url = "https://git.flake.sh";
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
        python3
        python311Packages.pip
      ];
    };
  };
}
