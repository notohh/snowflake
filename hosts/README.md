# :computer: hosts

my different hosts, each with their own unique configurations and purposes.

| Name      | Description                                                                                                     |
| --------- | --------------------------------------------------------------------------------------------------------------- |
| `ame`     | T480 laptop, mainly used for experimenting atm                                                                  |
| `arashi`  | postgres / redis vm                                                                                             |
| `haru`    | adblocker / DNS proxy vm                                                                                        |
| `kariru`  | \*arr stack / seedbox vm                                                                                        |
| `kaze`    | s3 storage ran on a [buyvm slice](https://buyvm.net/kvm-dedicated-server-slices/), with block storage attached. |
| `sakura`  | main vm, hosting most internet connected services                                                               |
| `sora`    | hetzner vps                                                                                                     |
| `tsuki`   | main machine running hyprland                                                                                   |
| `tsuru`   | vm for ci/cd runners, and (potentially) a binary cache                                                          |
| `yuki`    | my old proxmox machine, now running pure nix                                                                    |
| `default` | defines `nixosConfigurations`                                                                                   |
| `deploy`  | defines deployment nodes for deploy-rs                                                                          |
