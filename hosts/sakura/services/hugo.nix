{pkgs, ...}: {
  environment.systemPackages = with pkgs; [hugo];
  virtualisation.oci-containers.containers.hugo = {
    image = "klakegg/hugo:0.111.3";
    cmd = ["server"];
    volumes = [
      "/home/notoh/docker/hugo:/src"
    ];
    ports = [
      "1313:1313"
    ];
  };
}
