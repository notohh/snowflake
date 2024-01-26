{pkgs, ...}: {
  programs.firefox = {
    enable = true;
    policies = {
      DisablePocket = true;
      DisplayBookmarksToolbar = true;
      DontCheckDefaultBrowser = true;
      OfferToSaveLogins = false;
      NoDefaultBookmarks = true;
      PasswordManagerEnable = false;
      DNSOverHTTPS = {
        Enabled = true;
      };
    };
    profiles.notohh = {
      id = 0;
      isDefault = true;
      name = "notohh";
      settings = {
        "browser.search.separatePrivateDefault" = false;
        "browser.search.separatePrivateDefault.ui.enabled" = true;
        "browser.startup.homepage" = "http://dashboard.internal.flake.sh/";
        "network.trr.mode" = 3;
        "network.trr.uri" = "https://dns.quad9.net/dns-query";
        "dom.security.https_first" = true;
        "dom.security.https_only_mode" = true;
        "dom.security.https_only_mode_ever_enabled" = true;
        "network.trr.excluded-domains" = ''
          ,
          pve.internal.flake.sh,
          pbs.internal.flake.sh,
          truenas.internal.flake.sh,
          udm.internal.flake.sh,
          dashboard.internal.flake.sh,
          stash.internal.flake.sh,
          synology.internal.flake.sh,
          wallos.internal.flake.sh,
          jellyfin.internal.flake.sh,
          jellyseerr.internal.flake.sh,
          sonarr.internal.flake.sh,
          radarr.internal.flake.sh,
          readarr.internal.flake.sh,
          lidarr.internal.flake.sh,
          bazarr.internal.flake.sh,
          whisparr.internal.flake.sh,
          prowlarr.internal.flake.sh
        '';
      };
      extraConfig = builtins.readFile ./user.js/betterfox.js;
      search = {
        default = "SearXNG";
        force = true;
        engines = {
          "SearXNG" = {
            urls = [
              {
                template = "http://100.108.113.89:8100";
                params = [
                  {
                    name = "q";
                    value = "{searchTerms}";
                  }
                ];
              }
            ];
            definedAliases = ["@sx"];
          };
          "Nix Packages" = {
            urls = [
              {
                template = "https://search.nixos.org/packages";
                params = [
                  {
                    name = "type";
                    value = "packages";
                  }
                  {
                    name = "query";
                    value = "{searchTerms}";
                  }
                ];
              }
            ];
            icon = "''${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = ["@np"];
          };
          "Bing".metaData.hidden = true;
          "Google".metaData.hidden = true;
          "Amazon.com".metaData.hidden = true;
          "eBay".metaData.hidden = true;
          "DuckDuckGo".metaData.hidden = true;
        };
      };
      extensions = with pkgs.nur.repos.rycee.firefox-addons; [
        # security
        bitwarden
        ublock-origin
        canvasblocker

        #leisure
        darkreader
        mal-sync
        stylus

        #utility
        new-tab-override
        libredirect

        #misc
        tokyo-night-v2
      ];
    };
  };
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "x-scheme-handler/discord-409416265891971072" = ["discord-409416265891971072.desktop"];
      "x-scheme-handler/discord-402572971681644545" = ["discord-402572971681644545.desktop"];
      "x-scheme-handler/discord-696343075731144724" = ["discord-696343075731144724.desktop"];
      "x-scheme-handler/http" = ["firefox.desktop"];
      "x-scheme-handler/https" = ["firefox.desktop"];
      "x-scheme-handler/chrome" = ["firefox.desktop"];
      "text/html" = ["firefox.desktop"];
      "application/x-extension-htm" = ["firefox.desktop"];
      "application/x-extension-html" = ["firefox.desktop"];
      "application/x-extension-shtml" = ["firefox.desktop"];
      "application/xhtml+xml" = ["firefox.desktop"];
      "application/x-extension-xhtml" = ["firefox.desktop"];
      "application/x-extension-xht" = ["firefox.desktop"];
    };
  };
}
