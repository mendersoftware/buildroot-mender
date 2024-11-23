################################################################################
#
# mender-flash
#
################################################################################

# 1.0.2
MENDER_FLASH_VERSION = 8eea8dcc55266d9a657f9d61dd7aa119aab675ac
MENDER_FLASH_SITE = https://github.com/mendersoftware/mender-flash.git
MENDER_FLASH_SITE_METHOD = git
MENDER_FLASH_GIT_SUBMODULES = YES
MENDER_FLASH_LICENSE = Apache-2.0
MENDER_FLASH_CPE_ID_VENDOR = northern.tech
MENDER_FLASH_LICENSE_FILES = LICENSE
MENDER_FLASH_DEPENDENCIES = mender

$(eval $(cmake-package))
