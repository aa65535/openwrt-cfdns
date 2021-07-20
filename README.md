CloudflareDNS for OpenWrt
===


编译
---

 - 从 OpenWrt 的 [SDK][S] 编译  

   ```bash
   # 以 ar71xx 平台为例
   tar xjf OpenWrt-SDK-ar71xx-for-linux-x86_64-gcc-4.8-linaro_uClibc-0.9.33.2.tar.bz2
   cd OpenWrt-SDK-ar71xx-*
   # 获取 Makefile
   git clone https://github.com/aa65535/openwrt-cfdns.git package/cfdns
   # 选择要编译的包 Network -> CloudflareDNS
   make menuconfig
   # 开始编译
   make package/cfdns/compile V=99
   ```
