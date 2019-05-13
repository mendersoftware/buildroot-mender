export BR2_EXTERNAL ?= $(realpath buildroot-external-mender)
export BR2_GLOBAL_PATCH_DIR ?= $(realpath buildroot-external-mender)

.DEFAULT_GOAL := all

%:
	$(MAKE) -C buildroot $@

