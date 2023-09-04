_: {
  systemd.services.jellyfin-rpc = {
    enable = true;
    wantedBy = [
      "multi-user.target"
    ];
    description = "Displays the content you're currently watching on Discord!";

    serviceConfig = {
      User = "root";
      ExecStart = "/nix/store/gfwcai4i1cl3w8lbli4dsg0z369z2fn4-user-environment/bin/jellyfin-rpc --config /home/notoh/.config/jellyfin-rpc/main.json";
      Restart = "always";
      RestartSec = 30;
    };
  };
}
