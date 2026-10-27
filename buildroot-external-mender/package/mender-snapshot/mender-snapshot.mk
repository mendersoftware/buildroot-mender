################################################################################
#
# mender-snapshot
#
################################################################################

MENDER_SNAPSHOT_VERSION = 1.0.1
MENDER_SNAPSHOT_SITE = $(call github,mendersoftware,mender-snapshot,$(MENDER_SNAPSHOT_VERSION))
MENDER_SNAPSHOT_LICENSE = Apache-2.0
MENDER_SNAPSHOT_CPE_ID_VENDOR = northern.tech
MENDER_SNAPSHOT_LICENSE_FILES = \
	LICENSE \
	LIC_FILES_CHKSUM.sha256 \
	vendor/github.com/mendersoftware/progressbar/LICENSE \
	vendor/golang.org/x/sys/LICENSE \
	vendor/golang.org/x/term/LICENSE \
	vendor/github.com/pkg/errors/LICENSE \
	vendor/github.com/stretchr/testify/internal/difflib/LICENSE \
	vendor/github.com/cpuguy83/go-md2man/v2/LICENSE.md \
	vendor/github.com/urfave/cli/v2/LICENSE \
	vendor/github.com/sirupsen/logrus/LICENSE \
	vendor/github.com/mattn/go-isatty/LICENSE \
	vendor/github.com/ungerik/go-sysfs/LICENSE \
	vendor/github.com/stretchr/testify/LICENSE \
	vendor/github.com/creack/pty/LICENSE \
	vendor/github.com/xrash/smetrics/LICENSE \
	vendor/go.yaml.in/yaml/v3/LICENSE \
	vendor/github.com/russross/blackfriday/v2/LICENSE.txt \
	vendor/github.com/stretchr/testify/internal/spew/LICENSE


$(eval $(golang-package))
