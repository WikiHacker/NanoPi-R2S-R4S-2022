#!/bin/bash

#扎入风扇~
wget -P ./target/linux/rockchip/armv8/base-files/etc/init.d/ https://github.com/friendlyarm/friendlywrt/raw/master-v19.07.1/target/linux/rockchip-rk3399/base-files/etc/init.d/fa-rk3399-pwmfan
wget -P ./target/linux/rockchip/armv8/base-files/usr/bin/ https://github.com/friendlyarm/friendlywrt/raw/master-v19.07.1/target/linux/rockchip-rk3399/base-files/usr/bin/start-rk3399-pwm-fan.sh
chmod 777 target/linux/rockchip/armv8/base-files/etc/init.d/fa-rk3399-pwmfan
chmod 777 target/linux/rockchip/armv8/base-files/usr/bin/start-rk3399-pwm-fan.sh

# Addd mosdns
svn export https://github.com/QiuSimons/openwrt-mos/trunk/mosdns ./package/lean/mosdns
svn export https://github.com/QiuSimons/openwrt-mos/trunk/luci-app-mosdns ./package/lean/luci-app-mosdns
svn export https://github.com/QiuSimons/openwrt-mos/trunk/v2ray-geodata ./package/lean/v2ray-geodata

# Add cpufreq
rm -rf ./feeds/luci/applications/luci-app-cpufreq 
svn co https://github.com/immortalwrt/luci/trunk/applications/luci-app-cpufreq ./feeds/luci/applications/luci-app-cpufreq
ln -sf ./feeds/luci/applications/luci-app-cpufreq ./package/feeds/luci/luci-app-cpufreq
sed -i 's,1608,1800,g' feeds/luci/applications/luci-app-cpufreq/root/etc/uci-defaults/10-cpufreq
sed -i 's,2016,2208,g' feeds/luci/applications/luci-app-cpufreq/root/etc/uci-defaults/10-cpufreq
sed -i 's,1512,1608,g' feeds/luci/applications/luci-app-cpufreq/root/etc/uci-defaults/10-cpufreq
rm -rf ./target/linux/rockchip/armv8/base-files/etc/hotplug.d/usb

# Clone community packages to package/community
mkdir package/community
pushd package/community


# Add luci-app-passwall
git clone --depth=1 https://github.com/xiaorouji/openwrt-passwall
svn co https://github.com/xiaorouji/openwrt-passwall/branches/luci/luci-app-passwall

# Add Lienol's Packages
git clone --depth=1 https://github.com/Lienol/openwrt-package
rm -rf openwrt-package/verysync
rm -rf openwrt-package/luci-app-verysync

# Add luci-app-ssr-plus
git clone --depth=1 https://github.com/fw876/helloworld

# Add luci-app-unblockneteasemusic
rm -rf ../../customfeeds/luci/applications/luci-app-unblockmusic
git clone --depth=1 https://github.com/UnblockNeteaseMusic/luci-app-unblockneteasemusic.git

# Add luci-app-vssr <M>
git clone --depth=1 https://github.com/jerrykuku/lua-maxminddb.git
git clone --depth=1 https://github.com/jerrykuku/luci-app-vssr

# Add luci-proto-minieap
git clone --depth=1 https://github.com/ysc3839/luci-proto-minieap

# Add OpenClash
svn co https://github.com/vernesong/OpenClash/trunk/luci-app-openclash

# Add luci-app-adguardhome
svn co https://github.com/Lienol/openwrt-package/branches/other/luci-app-adguardhome

# Add ddnsto & linkease
svn co https://github.com/linkease/nas-packages-luci/trunk/luci/luci-app-ddnsto
svn co https://github.com/linkease/nas-packages-luci/trunk/luci/luci-app-linkease
svn co https://github.com/linkease/nas-packages/trunk/network/services/ddnsto
svn co https://github.com/linkease/nas-packages/trunk/network/services/linkease

# Add luci-app-onliner (need luci-app-nlbwmon)
git clone --depth=1 https://github.com/rufengsuixing/luci-app-onliner

# Add luci-app-oled (R2S Only)
git clone --depth=1 https://github.com/NateLol/luci-app-oled

# Add ServerChan
git clone --depth=1 https://github.com/tty228/luci-app-serverchan

# Add luci-app-dockerman
rm -rf ../../customfeeds/luci/collections/luci-lib-docker
rm -rf ../../customfeeds/luci/applications/luci-app-docker
rm -rf ../../customfeeds/luci/applications/luci-app-dockerman
git clone --depth=1 https://github.com/lisaac/luci-app-dockerman
git clone --depth=1 https://github.com/lisaac/luci-lib-docker

# Add luci-theme-argon
git clone --depth=1 -b 18.06 https://github.com/jerrykuku/luci-theme-argon
git clone --depth=1 https://github.com/jerrykuku/luci-app-argon-config
rm -rf ../../customfeeds/luci/themes/luci-theme-argon
rm -rf ./luci-theme-argon/htdocs/luci-static/argon/img/bg1.jpg
cp -f $GITHUB_WORKSPACE/data/bg1.jpg luci-theme-argon/htdocs/luci-static/argon/img/bg1.jpg

# Add subconverter
git clone --depth=1 https://github.com/tindy2013/openwrt-subconverter

# Add luci-app-smartdns & smartdns
svn co https://github.com/281677160/openwrt-package/trunk/luci-app-smartdns

# Add luci-app-services-wolplus
svn co https://github.com/msylgj/OpenWrt_luci-app/trunk/luci-app-services-wolplus

# Add apk (Apk Packages Manager)
svn co https://github.com/openwrt/packages/trunk/utils/apk

# Add luci-udptools
svn co https://github.com/zcy85611/Openwrt-Package/trunk/luci-udptools
svn co https://github.com/zcy85611/Openwrt-Package/trunk/udp2raw
svn co https://github.com/zcy85611/Openwrt-Package/trunk/udpspeeder

# Add luci-app-poweroff
git clone --depth=1 https://github.com/esirplayground/luci-app-poweroff

# Add OpenAppFilter
git clone --depth=1 https://github.com/destan19/OpenAppFilter

# Add luci-aliyundrive-webdav
rm -rf ../../customfeeds/luci/applications/luci-app-aliyundrive-webdav 
rm -rf ../../customfeeds/luci/applications/aliyundrive-webdav
svn co https://github.com/messense/aliyundrive-webdav/trunk/openwrt/aliyundrive-webdav
svn co https://github.com/messense/aliyundrive-webdav/trunk/openwrt/luci-app-aliyundrive-webdav
popd

# Add Pandownload
pushd package/lean
svn co https://github.com/immortalwrt/packages/trunk/net/pandownload-fake-server
popd

# Mod zzz-default-settings
pushd package/lean/default-settings/files
sed -i '/http/d' zzz-default-settings
sed -i '/18.06/d' zzz-default-settings
export orig_version=$(cat "zzz-default-settings" | grep DISTRIB_REVISION= | awk -F "'" '{print $2}')
export date_version=$(date -d "$(rdate -n -4 -p ntp.aliyun.com)" +'%Y-%m-%d')
sed -i "s/${orig_version}/${orig_version} (${date_version})/g" zzz-default-settings
popd

# Fix mt76 wireless driver
pushd package/kernel/mt76
sed -i '/mt7662u_rom_patch.bin/a\\techo mt76-usb disable_usb_sg=1 > $\(1\)\/etc\/modules.d\/mt76-usb' Makefile
popd

# Add po2lmo
git clone --depth=1 https://github.com/openwrt-dev/po2lmo.git
pushd po2lmo
make && sudo make install
popd

# Change default shell to zsh
sed -i 's/\/bin\/ash/\/usr\/bin\/zsh/g' package/base-files/files/etc/passwd
# sed -i 's/5.15/5.10/g' target/linux/rockchip/Makefile
# Modify default IP
sed -i 's/192.168.1.1/192.168.11.1/g' package/base-files/files/bin/config_generate
sed -i '/uci commit system/i\uci set system.@system[0].hostname='FusionWrt'' package/lean/default-settings/files/zzz-default-settings
sed -i "s/OpenWrt /DHDAXCW @ FusionWrt /g" package/lean/default-settings/files/zzz-default-settings

#pushd target/linux/rockchip/patches-5.15
#cp -f $GITHUB_WORKSPACE/scripts/patch/994-wode.patch 994-wode.patch
#popd

# Custom configs
# git am $GITHUB_WORKSPACE/patches/lean/*.patch
# git am $GITHUB_WORKSPACE/patches/*.patch

echo -e " DHDAXCW's FusionWrt built on "$(date +%Y.%m.%d)"\n -----------------------------------------------------" >> package/base-files/files/etc/banner
