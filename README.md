# Please note: This repository is not maintained by Northern Tech anymore.
# However, it is under active development!
#
#
# It is recommended you use this repository for the latest mender packagess if you plan on using Mender with your Buildroot system, as the maintainers of Buildroot are slow to respond to pull requests that bump the Mender package versions. Sometimes up to 4+ months.

# Buildroot community board integrations for Mender

Mender is an open source over-the-air (OTA) software updater for embedded Linux
devices. Mender comprises a client running at the embedded device, as well as
a server that manages deployments across many devices.

This repository contains Buildroot board integrations for various boards.

Please check out [https://hub.mender.io](https://hub.mender.io/c/board-integrations/Board-integrations-for-Buildroot) for more information on supported boards and detailed instructions on how to setup the build environment
to create images.

## Getting started

### Prerequisites:
  - A computer running Linux
  - Docker
  - docker-compose

To start using Mender, we recommend that you begin with the Getting started
section in [the Mender documentation](https://docs.mender.io/).

## Quick setup
  - Clone this repository:
    - `git clone https://github.com/mendersoftware/buildroot-mender`
  - Build the docker container:
    - `make build`
 - choose the board you want to build by looking in the docker/ directory for .json files. IE: docker/x86_64.json
 - Start the docker container. The build will start automatically. IE:
   - `ENV_FILES=x86_64.json make up`
 - Images are found in `buildroot-external-mender/output/${config_name}/images`

## Currently tested boards:
  - x86_64

## Other notes:
  - See docker/env.json.readme for env file options.
  - See `make help` for make file options.
  - `make shell` will skip building and put you into the docker shell. Navigate to `buildroot-external-mender/output/${config_name}` to build manually.
  - Board files are found in `buildroot-external-mender/board`
  - Config files are found in `buildroot-external-mender/configs`
  - Buildroot patches are found in `buildroot-external-mender/patches/builldroot`
  - After building x86_64_mender_defconfig run `make x64-run` to start the virtual image. Console is found on the serial port.
  - All defconfigs build.


## Contributing

## Please raise an issue if a board does not build or boot!

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
* Create an issue in the [bugtracker](https://northerntech.atlassian.net/projects/MEN)
* Email us at [contact@mender.io](mailto:contact@mender.io)
* Connect to the [#mender IRC channel on Libera](https://web.libera.chat/?#mender)

## Authors

Mender was created by the team at [Northern.tech AS](https://northern.tech), with many contributions from
the community. Thanks [everyone](https://github.com/mendersoftware/mender/graphs/contributors)!

[Mender](https://mender.io) is sponsored by [Northern.tech AS](https://northern.tech).
