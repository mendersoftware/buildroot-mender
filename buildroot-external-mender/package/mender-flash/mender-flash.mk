################################################################################
#
# mender-flash
#
################################################################################

# 1.0.0: The tag does provide the submodules
MENDER_FLASH_VERSION = 842e984d5ef19e7a539957a6fc31f9a177a7bacd
MENDER_FLASH_SITE = https://github.com/mendersoftware/mender-flash.git
MENDER_FLASH_SITE_METHOD = git
MENDER_FLASH_GIT_SUBMODULES = YES
MENDER_FLASH_LICENSE = Apache-2.0
MENDER_FLASH_CPE_ID_VENDOR = northern.tech
MENDER_FLASH_LICENSE_FILES = LICENSE
MENDER_FLASH_DEPENDENCIES = mender

$(eval $(cmake-package))
