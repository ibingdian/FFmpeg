#!/bin/bash
# output location

PREFIX=./android/armeabi-v7a2

NDK_ROOT=/Users/zhukun/Library/Android/sdk/ndk-bundle

TOOLCHAIN=/Users/zhukun/Library/Android/sdk/ndk-bundle/toolchains/arm-linux-androideabi-4.9/prebuilt/darwin-x86_64



./configure \
--disable-x86asm \
--prefix=$PREFIX \
--enable-small \
--disable-programs \
--disable-filters \
--disable-avdevice \
--disable-encoders \
--disable-muxers \
--enable-cross-compile \
# 执行程序
--cross-prefix=$TOOLCHAIN/bin/arm-linux-androideabi- \
# 只要静态库
--disable-shared \
--enable-static \

# 平台
--sysroot=$NDK_ROOT/platforms/android-17/arch-arm \

# 由于AndroidStudio的NDK是使用ninjia操作的要兼容，才能在android中使用；mk淘汰了？
--extra-cflags="-isysroot $NDK_ROOT/sysroot -isystem $NDK_ROOT/sysroot/usr/include/arm-linux-androideabi -D__ANDROID_API__=17 -U_FILE_OFFSET_BITS  -DANDROID -ffunction-sections -funwind-tables -fstack-protector-strong -no-canonical-prefixes -march=armv7-a -mfloat-abi=softfp -mfpu=vfpv3-d16 -mthumb -Wa,--noexecstack -Wformat -Werror=format-security  -O0 -fPIC" \

# 目标系统
--arch=arm \
--target-os=android

# 安装makefile
make clean
make install
