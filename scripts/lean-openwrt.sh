#!/bin/bash

# Add luci-app-ssr-plus
pushd package/lean
git clone --depth=1 https://github.com/fw876/helloworld
popd

rm -rf ./package/kernel/linux/modules/fs.mk
wget -P ./package/kernel/linux/modules/ https://raw.githubusercontent.com/LPDDR6-10000MHz/lede/master/package/kernel/linux/modules/fs.mk

# Clone community packages to package/community
mkdir package/community
pushd package/community

# Add Lienol's Packages
git clone --depth=1 https://github.com/Lienol/openwrt-package
rm -rf openwrt-package/verysync
rm -rf openwrt-package/luci-app-verysync

# Add luci-app-vssr <M>
git clone --depth=1 https://github.com/jerrykuku/lua-maxminddb.git
git clone --depth=1 https://github.com/jerrykuku/luci-app-vssr

# Add mentohust & luci-app-mentohust
git clone --depth=1 https://github.com/BoringCat/luci-app-mentohust
git clone --depth=1 https://github.com/KyleRicardo/MentoHUST-OpenWrt-ipk

# Add luci-proto-minieap
git clone --depth=1 https://github.com/ysc3839/luci-proto-minieap

# Add luci-app-netdata
rm -rf ../lean/luci-app-netdata
#svn co https://github.com/281677160/openwrt-package/trunk/luci-app-netdata
svn co https://github.com/281677160/openwrt-package/trunk/feeds/luci/applications/luci-app-netdata
rm -rf ../../customfeeds/packages/admin/netdata
#svn co https://github.com/281677160/openwrt-package/trunk/netdata
svn co https://github.com/281677160/openwrt-package/trunk/feeds/packages/net/netdata

# Add ServerChan
git clone --depth=1 https://github.com/tty228/luci-app-serverchan

# Add OpenClash
git clone --depth=1 -b master https://github.com/vernesong/OpenClash

# Add luci-app-onliner (need luci-app-nlbwmon)
git clone --depth=1 https://github.com/rufengsuixing/luci-app-onliner

# Add luci-app-adguardhome
#svn co https://github.com/Lienol/openwrt/trunk/package/diy/luci-app-adguardhome
#svn co https://github.com/Lienol/openwrt/trunk/package/diy/adguardhome
svn co https://github.com/Lienol/openwrt/trunk/package/diy/luci-app-adguardhome

# Add luci-app-diskman
git clone --depth=1 https://github.com/SuLingGG/luci-app-diskman
mkdir parted
cp luci-app-diskman/Parted.Makefile parted/Makefile

rm -rf ../lean/luci-app-docker
git clone --depth=1 https://github.com/lisaac/luci-app-dockerman
git clone --depth=1 https://github.com/lisaac/luci-lib-docker

# Add luci-theme-argon
git clone --depth=1 -b 18.06 https://github.com/jerrykuku/luci-theme-argon
git clone --depth=1 https://github.com/jerrykuku/luci-app-argon-config
rm -rf ../lean/luci-theme-argon

svn co https://github.com/WikiHacker/openwrt-packages/trunk/smartdns
svn co https://github.com/WikiHacker/openwrt-packages/trunk/luci-app-smartdns

# Add luci-app-aliddns
svn co https://github.com/281677160/openwrt-package/trunk/feeds/luci/applications/luci-app-aliddns

# Add subconverter
git clone --depth=1 https://github.com/tindy2013/openwrt-subconverter

# Add extra wireless drivers
svn co https://github.com/immortalwrt/immortalwrt/branches/openwrt-18.06-k5.4/package/kernel/rtl8812au-ac
svn co https://github.com/immortalwrt/immortalwrt/branches/openwrt-18.06-k5.4/package/kernel/rtl8821cu
svn co https://github.com/immortalwrt/immortalwrt/branches/openwrt-18.06-k5.4/package/kernel/rtl8188eu
svn co https://github.com/immortalwrt/immortalwrt/branches/openwrt-18.06-k5.4/package/kernel/rtl8192du
svn co https://github.com/immortalwrt/immortalwrt/branches/openwrt-18.06-k5.4/package/kernel/rtl88x2bu

# Add dafeiji
#svn co https://github.com/immortalwrt/immortalwrt/branches/master/package/lean/luci-app-cpufreq
svn co https://github.com/281677160/openwrt-package/trunk/feeds/packages/utils/cpulimit
svn co https://github.com/281677160/openwrt-package/trunk/feeds/luci/applications/luci-app-cpulimit

# Add luci-udptools
#git clone --depth=1 https://github.com/zcy85611/openwrt-luci-kcp-udp
git clone --depth=1 https://github.com/hongwenjun/openwrt-luci-kcp-udp.git

# Add luci-app-wireguard
svn co https://github.com/openwrt/luci/trunk/applications/luci-app-wireguard

# Add OpenAppFilter
git clone --depth=1 https://github.com/destan19/OpenAppFilter
popd

# Add CPUInfo
#pushd feeds/luci/modules/luci-mod-admin-full/luasrc/view/admin_status
#sed -i '/Load Average/i\\t\t<tr><td width="33%"><%:CPU Temperature%></td><td><%=luci.sys.exec("cut -c1-2 /sys/class/thermal/thermal_zone0/temp")%><span>&#8451;</span></td></tr>' index.htm
#sed -i '/Load Average/i\\t\t<tr><td width="33%"><%:欢迎订阅 Youbube 频道%></td><td><a href="https://www.youtube.com"><%:YOURENAME%></a></td></tr>' index.htm

# Add luci-app-ddnsto
pushd package/network/services
git clone --depth=1 https://github.com/linkease/ddnsto-openwrt
popd

# Add luci-app-linkease
pushd package/network/services
git clone --depth=1 https://github.com/linkease/linkease-openwrt
popd

# Add Pandownload
pushd package/lean
#svn co https://github.com/immortalwrt/immortalwrt/trunk/package/lean/pandownload-fake-server
svn co https://github.com/immortalwrt/packages/trunk/net/pandownload-fake-server
popd

# Mod zzz-default-settings
pushd package/lean/default-settings/files
sed -i '/http/d' zzz-default-settings
export orig_version="$(cat "zzz-default-settings" | grep DISTRIB_REVISION= | awk -F "'" '{print $2}')"
sed -i "s/${orig_version}/${orig_version} ($(date +"%Y.%m.%d"))/g" zzz-default-settings
popd

# Fix libssh
pushd feeds/packages/libs
rm -rf libssh
svn co https://github.com/openwrt/packages/trunk/libs/libssh
popd
# Fix mt76 wireless driver
pushd package/kernel/mt76
sed -i '/mt7662u_rom_patch.bin/a\\techo mt76-usb disable_usb_sg=1 > $\(1\)\/etc\/modules.d\/mt76-usb' Makefile
popd

# Use snapshots syncthing package
pushd feeds/packages/utils
rm -rf syncthing
svn co https://github.com/openwrt/packages/trunk/utils/syncthing
popd

# Fix mt76 wireless driver
pushd package/kernel/mt76
sed -i '/mt7662u_rom_patch.bin/a\\techo mt76-usb disable_usb_sg=1 > $\(1\)\/etc\/modules.d\/mt76-usb' Makefile
popd

# Add po2lmo
git clone https://github.com/openwrt-dev/po2lmo.git
pushd po2lmo
make && sudo make install
popd

# Change default shell to zsh
sed -i 's/\/bin\/ash/\/usr\/bin\/zsh/g' package/base-files/files/etc/passwd

# Modify default IP
sed -i 's/192.168.1.1/192.168.2.1/g' package/base-files/files/bin/config_generate
sed -i '/uci commit system/i\uci set system.@system[0].hostname='MocoWrt'' package/lean/default-settings/files/zzz-default-settings
sed -i "s/OpenWrt /MocoWrt build $(TZ=UTC-8 date "+%Y.%m.%d") @ MocoWrt /g" package/lean/default-settings/files/zzz-default-settings

#Test kernel 5.15
#sed -i 's/5.15/5.4/g' target/linux/rockchip/Makefile

# Custom configs
git am $GITHUB_WORKSPACE/patches/lean/*.patch
echo -e " MocoWrt built on "$(date +%Y.%m.%d)"\n -----------------------------------------------------" >> package/base-files/files/etc/banner
