################################################################################
#
# mender-flash
#
################################################################################

MENDER_FLASH_VERSION = 1.1.0
MENDER_FLASH_SITE = $(call github,mendersoftware,mender-flash,$(MENDER_FLASH_VERSION))
# MENDER_FLASH_GIT_SUBMODULES = YES
MENDER_FLASH_LICENSE = Apache-2.0
MENDER_FLASH_CPE_ID_VENDOR = northern.tech
MENDER_FLASH_LICENSE_FILES = LICENSE
MENDER_FLASH_DEPENDENCIES = mender

$(eval $(cmake-package))
