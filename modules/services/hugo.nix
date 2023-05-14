{pkgs, ...}: {
  environment.systemPackages = with pkgs; [hugo];
  virtualisation.oci-containers.containers.hugo = {
    image = "klakegg/hugo:0.101.0";
    cmd = ["server"];
    volumes = [
      "/home/notoh/docker/hugo:/src"
    ];
  };
}
