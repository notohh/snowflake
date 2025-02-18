{config, ...}: {
  imports = [
    ./widgets.nix
    ./services.nix
  ];

  sops.secrets.homepage-secrets = {
    sopsFile = ../../../../secrets/homepage/secrets.yaml;
  };

  services.homepage-dashboard = {
    enable = true;
    listenPort = 7676;
    openFirewall = true;
    environmentFile = config.sops.secrets.homepage-secrets.path;
    settings = {
      base = "https://dashboard.internal.flake.sh/";
      title = "kumo";
      language = "en";
      headerStyle = "boxedWidgets";
      disableCollape = true;
      favicon = "https://em-content.zobj.net/source/twitter/376/cloud_2601-fe0f.png";
      cardBlur = "md";
      theme = "dark";
      color = "gray";
      fiveColumns = true;
      statusStyle = "dot";
      hideVersion = true;
      background = {
        image = "https://git.flake.sh/notohh/assets/raw/branch/main/wallpapers/miku/miku.png";
        brightness = 75;
      };
      providers = {
        openweathermap = "{{HOMEPAGE_VAR_OPENWEATHERMAP}}";
      };
      layout = [
        {
          "Sora" = {
            style = "row";
            columns = 3;
          };
        }
        {
          "News" = {
            style = "row";
            columns = 1;
          };
        }
        {
          "Infra" = {
            style = "row";
            columns = 4;
          };
        }
        {
          "Networking" = {
            style = "row";
            columns = 1;
          };
        }
        {
          "Monitoring" = {
            style = "row";
            columns = 2;
          };
        }
        {
          "Media" = {
            style = "row";
            columns = 2;
          };
        }
        {
          "Misc apps" = {
            style = "row";
            columns = 2;
          };
        }
        {
          "Misc" = {
            style = "row";
            columns = 5;
          };
        }
      ];
    };
  };
}
