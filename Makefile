#
# Copyright (C) 2022 TowerSoftware Ltd
#
# This is free software, licensed under the GNU General Public License v3.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=python-pyserial-asyncio
PKG_VERSION:=0.6
PKG_RELEASE:=1

PYPI_NAME:=pyserial-asyncio
PKG_HASH:=409f32a35a3b530e6b2224e2a5b367da


PKG_LICENSE:=BSD
PKG_MAINTAINER:=DumTux <tekobase@outlook.com>

include ../pypi.mk
include $(INCLUDE_DIR)/package.mk
include ../python3-package.mk

define Package/python3-pyserial-asyncio
  SECTION:=lang-python
  CATEGORY:=TowerSoftware
  SUBMENU:=Python packages
  TITLE:=python3-pyserial-asyncio
  URL:=https://github.com/pyserial/pyserial-asyncio
  DEPENDS:=+python3-light +python3-pyserial
endef

define Package/python3-pyserial-asyncio/description
Async I/O extension for the Python Serial Port package for OSX, Linux, BSD.
Support for Windows is included, though with a different implementation based on polling
which may be slower than on other platforms.


endef

$(eval $(call Py3Package,python3-pyserial-asyncio))
$(eval $(call BuildPackage,python3-pyserial-asyncio))
