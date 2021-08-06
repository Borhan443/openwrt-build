#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate

# fix go version
pushd feeds/packages/lang
rm -fr golang
svn co https://github.com/coolsnowwolf/packages/trunk/lang/golang
popd
# fix kcptun version
pushd feeds/packages/net
rm -fr kcptun
svn co https://github.com/coolsnowwolf/packages/trunk/net/kcptun
popd

pushd feeds/packages/kernel/ksmbd
rm -fr Makefile
wget https://raw.githubusercontent.com/openwrt/packages/2543c33b0b05db79954124b469dedc8717d7c584/kernel/ksmbd/Makefile
popd

svn list https://svn.unix-ag.uni-kl.de/vpnc/trunk << EOF
p
EOF
