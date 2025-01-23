{pkgs, ...}: {
  programs.firefox = {
    enable = false;
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
        default = "DuckDuckGo";
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
          "DuckDuckGo".metaData.hidden = false;
        };
      };
      extensions = with pkgs.nur.repos.rycee.firefox-addons; [
        # security
        bitwarden
        ublock-origin

        #leisure
        darkreader
        mal-sync
        stylus
        firefox-color

        #utility
        new-tab-override
        sponsorblock
        return-youtube-dislikes
        violentmonkey
      ];
    };
  };
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "x-scheme-handler/discord-409416265891971072" = ["discord-409416265891971072.desktop"];
      "x-scheme-handler/discord-402572971681644545" = ["discord-402572971681644545.desktop"];
      "x-scheme-handler/discord-696343075731144724" = ["discord-696343075731144724.desktop"];
      "x-scheme-handler/http" = ["zen.desktop"];
      "x-scheme-handler/https" = ["zen.desktop"];
      "x-scheme-handler/chrome" = ["zen.desktop"];
      "text/html" = ["firefox.desktop"];
      "application/x-extension-htm" = ["zen.desktop"];
      "application/x-extension-html" = ["zen.desktop"];
      "application/x-extension-shtml" = ["zen.desktop"];
      "application/xhtml+xml" = ["zen.desktop"];
      "application/x-extension-xhtml" = ["zen.desktop"];
      "application/x-extension-xht" = ["zen.desktop"];
    };
  };
}
