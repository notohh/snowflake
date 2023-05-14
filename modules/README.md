# :electric_plug: modules

this directory hosts some common modules / services / security tweaks used on (most) hosts.

name            | description
--------------- | -----------
`services`      | houses my oci containers
`default`       | used for commonly shared modules
`fonts`         | font handling
`greetd`        | login manager
`networking`    | common network configuration
`nix`           | common nix configuration
`security`      | stolen from [hlissner](https://github.com/hlissner)
`sops`          | configures sops-nix
`swayidle`      | idle manager daemon
`system.nix`    | commonly shared system settings
`udevd`         | fixes an issue when using `nixos-rebuild`, tracked [here](https://github.com/NixOS/nixpkgs/issues/180175)
`virtualisation`| basic docker configuration