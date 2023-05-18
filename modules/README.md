# :electric_plug: modules

this directory hosts some common modules / services / security tweaks used on (most) hosts.

name            | description
--------------- | -----------
`services`      | houses my oci containers, and other services
`default`       | used for commonly shared modules
`fonts`         | font handling
`greetd`        | login manager
`networking`    | common network configuration
`nix`           | common nix configuration
`openssh`       | configures openssh options
`security`      | stolen from [hlissner](https://github.com/hlissner)
`sops`          | configures sops-nix
`swayidle`      | idle manager daemon
`system.nix`    | commonly shared system settings
`users.nix`     | defines all hosts users & groups
`virtualisation`| basic docker configuration