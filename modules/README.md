<h1 align="center">:electric_plug: modules</h1>

this directory hosts some common modules / services / security tweaks used on (most) hosts.

name            | description
--------------- | -----------
`default`       | used for commonly shared modules, for multiple home-manager configs
`fonts`         | font handling
`greetd`        | login manager
`networking`    | common network configuration
`security`      | stolen from [hlissner](https://github.com/hlissner)
`swayidle`      | idle manager daemon
`udevd`         | fixes an issue when using `nixos-rebuild`, tracked [here](https://github.com/NixOS/nixpkgs/issues/180175)