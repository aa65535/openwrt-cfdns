#
# Copyright (C) 2021 Jian Chang <aa65535@live.com>
#
# This is free software, licensed under the GNU General Public License v3.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=CloudflareDNS
PKG_VERSION:=1.0.0
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/aa65535/CloudflareDNS.git
PKG_SOURCE_VERSION:=176093ee097bf6bf4e89706ce4aa44efd55ee78d
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_VERSION).tar.xz

PKG_LICENSE:=GPLv3
PKG_LICENSE_FILES:=LICENSE
PKG_MAINTAINER:=Jian Chang <aa65535@live.com>

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)/$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_VERSION)

PKG_INSTALL:=1
PKG_FIXUP:=autoreconf
PKG_USE_MIPS16:=0
PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk

define Package/CloudflareDNS
	SECTION:=net
	CATEGORY:=Network
	TITLE:=Resolve all domain names using Cloudflare into a CF better IP
	URL:=https://github.com/aa65535/CloudflareDNS
endef

define Package/CloudflareDNS/description
Resolve all domain names using Cloudflare into a CF better IP.
endef

define Package/CloudflareDNS/conffiles
/etc/config/cfdns
/etc/cfroute.txt
endef

define Package/CloudflareDNS/install
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/cfdns.init $(1)/etc/init.d/cfdns
	$(INSTALL_CONF) $(PKG_BUILD_DIR)/cfroute.txt $(1)/etc/cfroute.txt
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_DATA) ./files/cfdns.config $(1)/etc/config/cfdns
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/cfdns $(1)/usr/bin
endef

$(eval $(call BuildPackage,CloudflareDNS))
