{pkgs, ...}: {
  environment.systemPackages = [pkgs.davfs2];
  users.users.davfs2 = {
    group = "davfs2";
    isSystemUser = true;
  };
  users.groups.davfs2 = {};
  sops.secrets.davfs2 = {
    owner = "root";
    group = "root";
    mode = "0600";
    path = "/etc/davfs2/secrets";
  };

  fileSystems."/var/lib/mounted" = {
    device = "https://u384391.your-storagebox.de";
    fsType = "davfs";
    options = ["rw,file_mode=0660,dir_mode=0755" "0" "0"];
  };
}
