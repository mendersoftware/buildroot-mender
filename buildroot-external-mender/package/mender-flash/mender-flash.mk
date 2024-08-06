################################################################################
#
# mender-flash
#
################################################################################

MENDER_FLASH_VERSION = 0ccfb0d0319fb884170925fd13ae01082843840b
MENDER_FLASH_SITE = https://github.com/mendersoftware/mender-flash.git
MENDER_FLASH_SITE_METHOD = git
MENDER_FLASH_GIT_SUBMODULES = YES
MENDER_FLASH_LICENSE = Apache-2.0
MENDER_FLASH_CPE_ID_VENDOR = northern.tech
MENDER_FLASH_LICENSE_FILES = LICENSE
MENDER_FLASH_DEPENDENCIES = mender

$(eval $(cmake-package))
