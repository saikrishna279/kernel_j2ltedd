 #
 # Copyright © 2015, Varun Chitre "deathstalker279" <androidwall.nrt@gmail.com>
 #
 # Custom build script
 #
 # This software is licensed under the terms of the GNU General Public
 # License version 2, as published by the Free Software Foundation, and
 # may be copied, distributed, and modified under those terms.
 #
 # This program is distributed in the hope that it will be useful,
 # but WITHOUT ANY WARRANTY; without even the implied warranty of
 # MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 # GNU General Public License for more details.
 #
 # Please maintain this if you use this script or any part of it
 #
KERNEL_DIR=$PWD
ZIMAGE=$KERNEL_DIR/arch/arm/boot/zImage
BUILD_START=$(date +"%s")
blue='\033[0;34m'
cyan='\033[0;36m'
yellow='\033[0;33m'
red='\033[0;31m'
nocol='\033[0m'
# Modify the following variable if you want to build
export CROSS_COMPILE="/home/kowalski/tc/bin/arm-eabi-"
export ARCH=arm
export SUBARCH=arm
export KBUILD_BUILD_USER="deathstalker279"
export KBUILD_BUILD_HOST="TRACTION_KILLS"

compile_kernel ()
{
echo -e "$blue***********************************************"
echo "          Compiling WAP5 kernel          "
echo -e "***********************************************$nocol"
cd arch/arm/boot/dts/
rm *.dtb > /dev/null 2>&1
cd $KERNEL_DIR
DTBTOOL=$KERNEL_DIR/dtbTool
chmod a+x $DTBTOOL
make exynos3475-j2lteswa_defconfig
make -j12
if ! [ -a $ZIMAGE ];
then
echo -e "$red Kernel Compilation failed! Fix the errors! $nocol"
exit 1
fi
$DTBTOOL -2 -o $KERNEL_DIR/arch/arm/boot/dt.img -s 2048 -p $KERNEL_DIR/scripts/dtc/ $KERNEL_DIR/arch/arm/boot/dts/
cp $KERNEL_DIR/arch/arm/boot/dt.img $KERNEL_DIR/WAP5/tools/WAP5-dts.img
cp $KERNEL_DIR/arch/arm/boot/zImage $KERNEL_DIR/WAP5/tools/WAP5
echo -e "***********************************************$nocol"
echo -e "***********************************************$nocol"
echo -e "***********************************************$nocol"
echo -e "***********************************************$nocol"
echo -e "$blue Firing up Traction!"
echo -e "***********************************************$nocol"
echo -e "***********************************************$nocol"
echo -e "***********************************************$nocol"
echo -e "***********************************************$nocol"
cd $KERNEL_DIR/WAP5
rm *.zip > /dev/null 2>&1
zip -r WAP5.zip * > /dev/null
}

case $1 in
clean)
make ARCH=arm -j8 clean mrproper
rm -rf include/linux/autoconf.h
;;
*)
compile_kernel
;;
esac
BUILD_END=$(date +"%s")
DIFF=$(($BUILD_END - $BUILD_START))
echo -e "$yellow Build completed in $(($DIFF / 60)) minute(s) and $(($DIFF % 60)) seconds.$nocol"
