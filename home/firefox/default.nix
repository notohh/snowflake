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
        "network.trr.mode" = 5;
        "dom.security.https_first" = true;
        "dom.security.https_only_mode" = true;
        "dom.security.https_only_mode_ever_enabled" = true;
      };
      extraConfig = builtins.readFile ./user.js/betterfox.js;
      search = {
        default = "Kagi";
        force = true;
        engines = {
          "Kagi" = {
            urls = [
              {
                template = "https://kagi.com/search";
                params = [
                  {
                    name = "q";
                    value = "{searchTerms}";
                  }
                ];
              }
            ];
            definedAliases = ["@g"];
          };
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
        kagi-search

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
