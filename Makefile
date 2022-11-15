#
# Copyright (C) 2022 TowerSoftware Ltd
#
# This is free software, licensed under the GNU General Public License v3.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/kernel.mk

PKG_NAME:=mt7688-agpio-switch
PKG_VERSION:=1.0

include $(INCLUDE_DIR)/package.mk


MAKE_OPTS:=$(KERNEL_MAKE_FLAGS) \
  SUBDIRS="$(PKG_BUILD_DIR)" \
    M="$(PKG_BUILD_DIR)" \
  EXTRA_CFLAGS="$(EXTRA_CFLAGS)" \
  CONFIG_AGPIO=m

define KernelPackage/agpioSwitch
  SECTION:=kernel
  CATEGORY:=TowerSoftware
  SUBMENU:=Kernel modules
  TITLE:=Switch AGPIO_CFG to enable 5 port ethernet on MT7688
  FILES:=$(PKG_BUILD_DIR)/agpioSwitch.ko
  AUTOLOAD:=$(call AutoLoad,81,agpioSwitch) 
endef

define Build/Prepare
  mkdir -p $(PKG_BUILD_DIR)/
  $(CP) -R ./src/* $(PKG_BUILD_DIR)/
endef

define Build/Compile
$(MAKE) -C "$(LINUX_DIR)" $(MAKE_OPTS) modules
endef

$(eval $(call KernelPackage,agpioSwitch)) 
