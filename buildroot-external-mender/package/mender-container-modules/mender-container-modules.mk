################################################################################
#
# mender-container-modules
#
################################################################################

MENDER_CONTAINER_MODULES_VERSION = 1.1.0
MENDER_CONTAINER_MODULES_SITE = $(call github,mendersoftware,mender-container-modules,$(MENDER_CONTAINER_MODULES_VERSION))
MENDER_CONTAINER_MODULES_LICENSE = Apache-2.0
MENDER_CONTAINER_MODULES_LICENSE_FILES = LICENSE
MENDER_CONTAINER_MODULES_DEPENDENCIES = mender

define MENDER_CONTAINER_MODULES_INSTALL_TARGET_CMDS
	DESTDIR=$(TARGET_DIR) make -C $(@D) install
endef

$(eval $(generic-package))
