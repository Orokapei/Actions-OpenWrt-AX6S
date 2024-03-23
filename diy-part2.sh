#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate

# Modify default theme
#sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# Modify hostname
#sed -i 's/OpenWrt/P3TERX-Router/g' package/base-files/files/bin/config_generate

# LAN IP
sed -i 's/192.168.1.1/192.168.17.1/g' package/base-files/files/bin/config_generate
# Timezone
sed -i '/timezone='\''UTC'\''/a\\t\tset system.@system[-1].zonename='\''Asia/Shanghai'\''' package/base-files/files/bin/config_generate
sed -i '/timezone='\''UTC'\''/s/UTC/CST-8/' package/base-files/files/bin/config_generate
# wifi
sed -i '/set wireless.${name}.disabled=1/d' package/network/config/wifi-scripts/files/lib/wifi/mac80211.sh
#rc.local
sed -i '4i\rm -rf /lib/upgrade/keep.d/*\nwifi' package/base-files/files/etc/rc.local
