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
# 强制将 ZTE Q7 设备树中的 sdhc 控制器状态改为激活
sed -i '/sdhci@10130000/,/status =/s/status = "disabled";/status = "okay";/' target/linux/ramips/dts/mt7620a_zte_q7.dts

# 双保险：在文件末尾追加覆盖节点，强制开启 media 控制器
echo -e "\n&sdmedia {\n\tstatus = \"okay\";\n};" >> target/linux/ramips/dts/mt7620a_zte_q7.dts
