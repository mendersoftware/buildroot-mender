################################################################################
#
# mender-configure-module
#
################################################################################

MENDER_CONFIGURE_MODULE_VERSION = 1.1.2
MENDER_CONFIGURE_MODULE_SITE = $(call github,mendersoftware,mender-configure-module,$(MENDER_CONFIGURE_MODULE_VERSION))
MENDER_CONFIGURE_MODULE_LICENSE = Apache-2.0
MENDER_CONFIGURE_MODULE_LICENSE_FILES = LICENSE
MENDER_CONFIGURE_MODULE_DEPENDENCIES = mender

MENDER_CONFIGURE_MODULE_INSTALL_TARGETS = bin

ifeq ($(BR2_PACKAGE_MENDER_CONFIGURE_MODULE_RASPBERRY_PI_LED_DEMO),y)
MENDER_CONFIGURE_MODULE_INSTALL_TARGETS += demo
endif

ifeq ($(BR2_PACKAGE_SYSTEMD),y)
MENDER_CONFIGURE_MODULE_INSTALL_TARGETS += systemd scripts
endif

define MENDER_CONFIGURE_MODULE_INSTALL_TARGET_CMDS
	$(foreach f,$(MENDER_CONFIGURE_MODULE_INSTALL_TARGETS), \
		DESTDIR=$(TARGET_DIR) make -C $(@D) install-$(f)
	)
endef

$(eval $(generic-package))
