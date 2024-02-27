################################################################################
#
# lmdb
#
################################################################################

LMDB_VERSION = 0.9.31
LMDB_SOURCE = LMDB_$(LMDB_VERSION).tar.gz
LMDB_SITE = https://github.com/LMDB/lmdb/archive/refs/tags
LMDB_LICENSE = OLDAP-2.8
LMDB_LICENSE_FILES = libraries/liblmdb/LICENSE
LMDB_INSTALL_STAGING = YES

define LMDB_BUILD_CMDS
	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/libraries/liblmdb
endef

define LMDB_INSTALL_STAGING_CMDS
	$(TARGET_CONFIGURE_OPTS) $(MAKE) \
		-C $(@D)/libraries/liblmdb DESTDIR=$(STAGING_DIR) prefix=/usr install
endef

define LMDB_INSTALL_TARGET_CMDS
	$(TARGET_CONFIGURE_OPTS) $(MAKE) \
		-C $(@D)/libraries/liblmdb DESTDIR=$(TARGET_DIR) prefix=/usr install
endef

$(eval $(generic-package))
