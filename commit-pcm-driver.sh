#!/bin/bash

if [ "$1" = "" ]
	then 
		echo "please type in a message as argument" 
		exit
	else 	
		MESSAGE="$1"
fi

OPENWRT_DIR=~/Binauric/openwrt
LINUX_DIR=carambola2/target-mips_34kc_uClibc-0.9.33.2/linux-ar71xx_generic/linux-3.10.49
LINUX_DIR=carambola2/linux
REPO_DIR=pcm-driver
PWD=$(pwd)

cp $OPENWRT_DIR/$LINUX_DIR/sound/soc/ar71xx/*.c $OPENWRT_DIR/$REPO_DIR
cp $OPENWRT_DIR/$LINUX_DIR/sound/soc/ar71xx/*.h $OPENWRT_DIR/$REPO_DIR

cp $OPENWRT_DIR/$LINUX_DIR/arch/mips/ath79/mach-carambola2.c $OPENWRT_DIR/$REPO_DIR
cp $OPENWRT_DIR/$LINUX_DIR/arch/mips/ath79/dev-pcm.c $OPENWRT_DIR/$REPO_DIR
cp $OPENWRT_DIR/$LINUX_DIR/arch/mips/ath79/dev-pcm.h $OPENWRT_DIR/$REPO_DIR

cp $OPENWRT_DIR/$LINUX_DIR/arch/mips/include/asm/mach-ath79/ar71xx_regs.h $OPENWRT_DIR/$REPO_DIR

rm $OPENWRT_DIR/$REPO_DIR/*.mod.c

cd $OPENWRT_DIR/$REPO_DIR
git add * 
git commit -m "$MESSAGE"

cd $PWD
echo "commited all files"
