_: {
  services.glance = {
    enable = true;
    openFirewall = true;
    settings = {
      asset-path = "";
      server = {
        host = "0.0.0.0";
        port = 7676;
      };
      branding = {
        custom-footer = ''<b><p>ᓚᘏᗢ</p></b>'';
      };
      pages = [
        ### home
        {
          name = "home";
          columns = [
            # left column
            {
              size = "small";
              widgets = [
                {
                  type = "clock";
                  hour-format = "24h";
                  timezones = [
                    {
                      timezone = "America/Los_Angeles";
                      label = "Los Angeles";
                    }
                    {
                      timezone = "Asia/Tokyo";
                      label = "Tokyo";
                    }
                    {
                      timezone = "Europe/London";
                      label = "London";
                    }
                  ];
                }
                {
                  type = "weather";
                  location = "New York, USA";
                }
                {
                  type = "twitch-channels";
                  collapse-after = 10;
                  sort-by = "viewers";
                  channels = [
                    "forsen"
                    "marisnot12"
                    "elis"
                    "elistard"
                    "fallenshadow"
                    "gamergirl"
                    "sinder"
                  ];
                }
              ];
            }
            # middle column
            {
              size = "full";
              widgets = [
                {
                  type = "search";
                  search-engine = "google";
                  bangs = [
                    {
                      title = "youtube";
                      shortcut = "!yt";
                      url = "https://www.youtube.com/results?search_query={QUERY}";
                    }
                    {
                      title = "nixpkgs";
                      shortcut = "!np";
                      url = "https://search.nixos.org/packages?channel=unstable&query={QUERY}";
                    }
                    {
                      title = "nixos";
                      shortcut = "!no";
                      url = "https://search.nixos.org/options?channel=unstable&query={QUERY}";
                    }
                  ];
                }
                {
                  type = "split-column";
                  widgets = [
                    {
                      type = "group";
                      collapse-after = 5;
                      widgets = [
                        {
                          type = "reddit";
                          subreddit = "hatsune";
                          collapse-after = 6;
                          show-thumbnails = true;
                        }
                        {
                          type = "reddit";
                          subreddit = "2007scape";
                          collapse-after = 6;
                          show-thumbnails = true;
                        }
                        {
                          type = "reddit";
                          subreddit = "osugame";
                          collapse-after = 6;
                          show-thumbnails = true;
                        }
                        {
                          type = "reddit";
                          subreddit = "hololive";
                          collapse-after = 6;
                          show-thumbnails = true;
                        }
                      ];
                    }
                  ];
                }
                {
                  type = "videos";
                  include-shorts = false;
                  channels = [
                    "UC3n5uGu18FoCy23ggWWp8tA" # Mumei
                    "UCIfAvpeIWGHb0duCkMkmm2Q" # Nimi
                    "UCNa9i8ifGJRlK2yWgM9DcOA" # dnsl
                    "UCSveVd5CV6-c5Qz64QVw91A" # 1dnsl
                    "UCkwy4YhSUdXyv1JhuhjRFOw" # 2dnsl
                    "UCfbnTUxUech4P1XgYUwYuKA" # Cold Ones
                    "UCJWKjrrUh2KL1d3zXQW79cQ" # EWU
                    "UCRmnt09hfWo6hD574tLVVDQ" # EWU Bodycam
                    "UCBNG0osIBAprVcZZ3ic84vw" # Jim Browning
                    "UCRcgy6GzDeccI7dkbbBna3Q" # LEMMiNO
                    "UC31msahuXK0g6Keb27d1wog" # Nanobaiter
                    "UCpFFItkfZz1qz5PpHpqzYBw" # Nexpo
                    "UCMeRgqzTfC5ja40B6kM6pdg" # osu!
                    "UC3Vuq4Q1bKFtAiKYlwRv3oA" # Peter Santenello
                    "UCV_w9-UYod7bPbazMW7Zp4A" # Scambaiter
                    "UCDKJdFer1phQI95UinPZehw" # Turkey Tom
                    "UCCAfRoTJrKPbSrh_Eg3i4vg" # TomDark
                    "UCZ4HyRUXSg62i9dWT6oIGIQ" # The Tape Library
                    "UCFQMnBA3CS502aghlcr0_aw" # Coffezilla
                    "UC28n0tlcNSa1iPe5mettocg" # voidzilla
                    "UCjw9YUv4UoA3d0V_Pc6zLTQ" # Brick Immortar
                    "UCODHrzPMGbNv67e84WDZhQQ" # fern
                    "UCYO_jab_esuFRV4b17AJtAw" # 3Blue1Brown
                    "UCsBjURrPoezykLs9EqgamOA" # Fireship
                    "UCS0N5baNlQWJCUrhCEo8WlA" # Ben Eater
                    "UCKGe7fZ_S788Jaspxg-_5Sg" # PC Security Channel
                  ];
                }
              ];
            }
            # right column
            {
              size = "small";
              widgets = [
                {
                  type = "calendar";
                }
                {
                  type = "bookmarks";
                  groups = [
                    {
                      title = "media";
                      links = [
                        {
                          title = "youtube";
                          url = "https://www.youtube.com";
                        }
                        {
                          title = "twitch";
                          url = "https://www.twitch.tv";
                        }
                        {
                          title = "reddit";
                          url = "https://www.reddit.com";
                        }
                        {
                          title = "lastfm";
                          url = "https://www.last.fm/user/notoh";
                        }
                        {
                          title = "anilist";
                          url = "https://anilist.co/user/notoh/animelist";
                        }
                      ];
                    }
                  ];
                }
              ];
            }
          ];
        }
        ### dev
        {
          name = "dev";
          columns = [
            # left column
            {
              size = "small";
              widgets = [
                {
                  type = "clock";
                  hour-format = "24h";
                  timezones = [
                    {
                      timezone = "America/Los_Angeles";
                      label = "Los Angeles";
                    }
                    {
                      timezone = "Asia/Tokyo";
                      label = "Tokyo";
                    }
                    {
                      timezone = "Europe/London";
                      label = "London";
                    }
                  ];
                }
              ];
            }
            # middle column
            {
              size = "full";
              widgets = [
                {
                  type = "split-column";
                  widgets = [
                    {
                      type = "group";
                      collapse-after = 5;
                      widgets = [
                        {
                          type = "reddit";
                          subreddit = "nixos";
                          collapse-after = 3;
                          show-thumbnails = true;
                        }
                        {
                          type = "reddit";
                          subreddit = "selfhosted";
                          collapse-after = 3;
                          show-thumbnails = true;
                        }
                        {
                          type = "reddit";
                          subreddit = "linux";
                          collapse-after = 3;
                          show-thumbnails = true;
                        }
                      ];
                    }
                    {
                      type = "group";
                      collapse-after = 5;
                      widgets = [
                        {
                          type = "repository";
                          repository = "nixos/nixpkgs";
                        }
                        {
                          type = "releases";
                          collapse-after = 5;
                          show-source-icon = true;
                          repositories = [
                            "hyprwm/hyprland"
                            "Vencord/Vesktop"
                            "dani-garcia/vaultwarden"
                            "Kesomannen/gale"
                            "immich-app/immich"
                            "LizardByte/Sunshine "
                          ];
                        }
                      ];
                    }
                  ];
                }
                {
                  type = "group";
                  widgets = [
                    {
                      type = "monitor";
                      title = "infra";
                      sites = [
                        {
                          title = "proxmox";
                          url = "https://pve.internal.flake.sh:8006";
                          allow-insecure = true;
                        }
                        {
                          title = "truenas";
                          url = "https://truenas.internal.flake.sh/";
                          allow-insecure = true;
                        }
                        {
                          title = "ubiquiti";
                          url = "https://udm.internal.flake.sh/network/default";
                          allow-insecure = true;
                        }
                        {
                          title = "uptime-kuma";
                          url = "https://status.flake.sh";
                        }
                        {
                          title = "grafana";
                          url = "https://metrics.flake.sh";
                        }
                      ];
                    }
                    {
                      type = "monitor";
                      title = "media";
                      sites = [
                        {
                          title = "jellyfin";
                          url = "https://jellyfin.internal.flake.sh";
                          allow-insecure = true;
                        }
                        {
                          title = "jellyseerr";
                          url = "https://jellyseerr.internal.flake.sh";
                          allow-insecure = true;
                        }
                        {
                          title = "sonarr";
                          url = "https://sonarr.internal.flake.sh";
                          allow-insecure = true;
                        }
                        {
                          title = "radarr";
                          url = "https://radarr.internal.flake.sh";
                          allow-insecure = true;
                        }
                        {
                          title = "prowlarr";
                          url = "https://prowlarr.internal.flake.sh";
                          allow-insecure = true;
                        }
                        {
                          title = "qbittorrent";
                          url = "http://192.168.1.54:8080/";
                          allow-insecure = true;
                        }
                        {
                          title = "immich";
                          url = "https://immich.internal.flake.sh";
                          allow-insecure = true;
                        }
                        {
                          title = "komga";
                          url = "https://komga.internal.flake.sh";
                          allow-insecure = true;
                        }
                        {
                          title = "stash";
                          url = "https://stash.internal.flake.sh";
                          allow-insecure = true;
                        }
                      ];
                    }
                    {
                      type = "monitor";
                      title = "misc";
                      sites = [
                        {
                          title = "wallos";
                          url = "https://wallos.internal.flake.sh";
                          allow-insecure = true;
                        }

                        {
                          title = "hoarder";
                          url = "https://hoarder.internal.flake.sh";
                          allow-insecure = true;
                        }
                      ];
                    }
                  ];
                }
              ];
            }
            # right column
            {
              size = "small";
              widgets = [
                {
                  type = "weather";
                  location = "New York, USA";
                }
              ];
            }
          ];
        }
      ];
    };
  };
}
