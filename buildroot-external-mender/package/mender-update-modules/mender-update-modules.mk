################################################################################
#
# mender-update-modules
#
################################################################################

MENDER_UPDATE_MODULES_VERSION = fa0080fdc69bebde13891b9a528739250681ad56
MENDER_UPDATE_MODULES_SITE = $(call github,mendersoftware,mender-update-modules,$(MENDER_UPDATE_MODULES_VERSION))
MENDER_UPDATE_MODULES_LICENSE = Apache-2.0
MENDER_UPDATE_MODULES_LICENSE_FILES = LICENSE
MENDER_UPDATE_MODULES_DEPENDENCIES = mender

ifeq ($(BR2_PACKAGE_MENDER_UPDATE_MODULES_DFU),y)
MENDER_UPDATE_MODULES_DEPENDENCIES += host-mender-artifact
MENDER_UPDATE_MODULES_MODULES += dfu
endif

ifeq ($(BR2_PACKAGE_MENDER_UPDATE_MODULES_DIR_OVERLAY),y)
MENDER_UPDATE_MODULES_DEPENDENCIES += host-mender-artifact
MENDER_UPDATE_MODULES_MODULES += dir-overlay
endif

ifeq ($(BR2_PACKAGE_MENDER_UPDATE_MODULES_DIRTY),y)
MENDER_UPDATE_MODULES_DEPENDENCIES += host-mender-artifact
MENDER_UPDATE_MODULES_MODULES += dirty
endif

ifeq ($(BR2_PACKAGE_MENDER_UPDATE_MODULES_IPK),y)
MENDER_UPDATE_MODULES_DEPENDENCIES += opkg
MENDER_UPDATE_MODULES_MODULES += ipk
endif

ifeq ($(BR2_PACKAGE_MENDER_UPDATE_MODULES_REBOOT),y)
MENDER_UPDATE_MODULES_MODULES += reboot
define MENDER_UPDATE_MODULES_INSTALL_MENDER_REBOOT_GEN
	$(INSTALL) -D -m 0755 $(@D)/reboot/reboot-gen \
		$(HOST_DIR)/bin/reboot-gen
endef
MENDER_UPDATE_MODULES_POST_INSTALL_TARGET_HOOKS += MENDER_UPDATE_MODULES_INSTALL_MENDER_REBOOT_GEN
endif

ifeq ($(BR2_PACKAGE_MENDER_UPDATE_MODULES_ROOTFS_VERSION_CHECK),y)
MENDER_UPDATE_MODULES_DEPENDENCIES += python3
MENDER_UPDATE_MODULES_MODULES += rootfs-version-check
define MENDER_UPDATE_MODULES_INSTALL_MENDER_COMPARE_VERSIONS
	$(INSTALL) -D -m 0755 $(@D)/rootfs-version-check/mender-compare-versions \
		$(TARGET_DIR)/usr/bin/mender-compare-versions
endef
MENDER_UPDATE_MODULES_POST_INSTALL_TARGET_HOOKS += MENDER_UPDATE_MODULES_INSTALL_MENDER_COMPARE_VERSIONS
endif

define MENDER_UPDATE_MODULES_INSTALL_TARGET_CMDS
	$(foreach f,$(MENDER_UPDATE_MODULES_MODULES), \
	$(INSTALL) -D -m 0755 $(@D)/$(f)/module/$(f) \
		$(TARGET_DIR)/usr/share/mender/modules/v3/$(f); \
	if [ -d $(@D)/$(f)/module-artifact-gen ]; then \
		$(INSTALL) -D -m 0755 $(@D)/$(f)/module-artifact-gen/$(f)-artifact-gen \
			$(HOST_DIR)/bin/$(f)-artifact-gen; \
	fi; \
	)
endef

$(eval $(generic-package))
