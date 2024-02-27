################################################################################
#
# mender-snapshot
#
################################################################################

MENDER_SNAPSHOT_VERSION = 1.0.0
MENDER_SNAPSHOT_SITE = $(call github,mendersoftware,mender-snapshot,$(MENDER_SNAPSHOT_VERSION))
MENDER_SNAPSHOT_LICENSE = Apache-2.0
MENDER_SNAPSHOT_CPE_ID_VENDOR = northern.tech
MENDER_SNAPSHOT_LICENSE_FILES = LICENSE

$(eval $(golang-package))
