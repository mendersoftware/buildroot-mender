# Buildroot community board integrations for Mender

Mender is an open source over-the-air (OTA) software updater for embedded Linux
devices. Mender comprises a client running at the embedded device, as well as
a server that manages deployments across many devices.

This repository contains Buildroot board integrations for various boards.

Please check out [https://hub.mender.io](https://hub.mender.io/c/board-integrations/Board-integrations-for-Buildroot) for more information on supported boards and detailed instructions on how to setup the build environment
to create images.

![Mender logo](https://mender.io/user/pages/resources/06.digital-assets/mender.io.png)

## Getting started

To start using Mender, we recommend that you begin with the Getting started
section in [the Mender documentation](https://docs.mender.io/).

## Quick setup

Clone this repository:

    git clone https://github.com/mendersoftware/buildroot-mender

Fetch submodules:

    git submodule update --init

These two steps should prepare the Buildroot environment.

To continue setting up the environment for a specific board please read the `readme.txt` for
respective board, e.g `buildroot-external-mender/board/freescale/imx8mqevk/readme.txt`

## Contributing

We welcome and ask for your contribution. If you would like to contribute to
Mender, please read our guide on how to best get started [contributing code or
documentation](https://github.com/mendersoftware/mender/blob/master/CONTRIBUTING.md).

## License

All files in this repository are licensed under the Apache License, Version 2.0, unless indicated otherwise.
[LICENSE](https://github.com/mendersoftware/buildroot-mender/blob/master/LICENSE) for the
full license text.

## Connect with us

* Join the [Mender Hub discussion forum](https://hub.mender.io)
* Follow us on [Twitter](https://twitter.com/mender_io). Please
  feel free to tweet us questions.
* Fork us on [Github](https://github.com/mendersoftware)
* Create an issue in the [bugtracker](https://tracker.mender.io/projects/MEN)
* Email us at [contact@mender.io](mailto:contact@mender.io)
* Connect to the [#mender IRC channel on Freenode](http://webchat.freenode.net/?channels=mender)

## Authors

Mender was created by the team at [Northern.tech AS](https://northern.tech), with many contributions from
the community. Thanks [everyone](https://github.com/mendersoftware/mender/graphs/contributors)!

[Mender](https://mender.io) is sponsored by [Northern.tech AS](https://northern.tech).
