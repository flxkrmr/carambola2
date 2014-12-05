#!/bin/bash

if [ "$1" = "v" ]
	then VERB="V=s"
	else VERB=""
fi


LINUX_DIR=target-mips_34kc_uClibc-0.9.33.2/linux-ar71xx_generic/linux-3.10.49
CUR_DIR=$(pwd)

echo "+++ quilt refresh +++"
cd build_dir/$LINUX_DIR
quilt refresh
cd $CUR_DIR

if [ "$?" != "0" ]; then
	echo "*** Error occurred"
	echo "Will stop now"
	exit
fi

echo "+++ make target/linux/update package/index +++"
make target/linux/update package/index $VERB

if [ "$?" != "0" ]; then
	echo "*** Error occurred"
	echo "Will stop now"
	exit
fi

echo "+++ make target/linux/compile +++"
make target/linux/compile $VERB

if [ "$?" != "0" ]; then
	echo "*** Error occurred"
	echo "Will stop now"
	exit
fi

echo "+++ make package/kernel/linux/compile +++"
make package/kernel/linux/compile $VERB

if [ "$?" != "0" ]; then
	echo "*** Error occurred"
	echo "Will stop now"
	exit
fi

echo "+++ done +++"

