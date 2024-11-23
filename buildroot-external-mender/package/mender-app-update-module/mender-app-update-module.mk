################################################################################
#
# mender-app-update-module
#
################################################################################

MENDER_APP_UPDATE_MODULE_VERSION = 1.1.0
MENDER_APP_UPDATE_MODULE_SITE = $(call github,mendersoftware,app-update-module,$(MENDER_APP_UPDATE_MODULE_VERSION))
MENDER_APP_UPDATE_MODULE_LICENSE = Apache-2.0
MENDER_APP_UPDATE_MODULE_LICENSE_FILES = LICENSE
MENDER_APP_UPDATE_MODULE_DEPENDENCIES = mender

define MENDER_APP_UPDATE_MODULE_INSTALL_TARGET_CMDS
	DESTDIR=$(TARGET_DIR) make -C $(@D) install
endef

$(eval $(generic-package))
