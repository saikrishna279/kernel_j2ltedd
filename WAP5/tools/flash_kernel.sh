cp -f /tmp/cpio /sbin/cpio
cd /tmp/
PATH_1=
PATH_2=
PATH_3=
for p in $(cat /etc/recovery.fstab | grep -w "/boot"); do
	if [ -z "$PATH_1" ]; then
		PATH_1=$p
	elif [ -z "$PATH_2" ]; then
		PATH_2=$p
	elif [ -z "$PATH_3" ]; then
		PATH_3=$p
	fi
done
if [ "$PATH_1" = "/boot" ]; then dd if=$PATH_3 of=/tmp/boot.img; fi
if [ "$PATH_2" = "/boot" ]; then dd if=$PATH_1 of=/tmp/boot.img; fi
for KERNEL_PARTITION in kern-a KERN-A android_boot ANDROID_BOOT kernel KERNEL boot BOOT lnx LNX; do
	for KERNEL_PATH in $(find /dev/block -name $KERNEL_PARTITION); do dd if=$KERNEL_PATH of=/tmp/boot.img; done
	for KERNEL_PATH in $(ls -Rl /dev/block | grep -w $KERNEL_PARTITION | cut -d">" -f2 | cut -d" " -f2); do dd if=$KERNEL_PATH of=/tmp/boot.img; done
done
./unpackbootimg -i /tmp/boot.img
./mkbootimg --kernel WAP5 --ramdisk /tmp/boot.img-ramdisk.gz --base 0x10000000 --pagesize 2048 --ramdisk_offset 0x11000000 --tags_offset 0x00000100 -o /tmp/WAP5boot.img
if [ -f /tmp/WAP5boot.img ]; then
	PATH_1=
	PATH_2=
	PATH_3=
	for p in $(cat /etc/recovery.fstab | grep -w "/boot"); do
		if [ -z "$PATH_1" ]; then
			PATH_1=$p
		elif [ -z "$PATH_2" ]; then
			PATH_2=$p
		elif [ -z "$PATH_3" ]; then
			PATH_3=$p
		fi
	done
	if [ "$PATH_1" = "/boot" ]; then dd if=/tmp/WAP5boot.img of=$PATH_3; fi
	if [ "$PATH_2" = "/boot" ]; then dd if=/tmp/WAP5boot.img of=$PATH_1; fi
	for KERNEL_PARTITION in kern-a KERN-A android_boot ANDROID_BOOT kernel KERNEL boot BOOT lnx LNX; do
		for KERNEL_PATH in $(find /dev/block -name $KERNEL_PARTITION); do dd if=/tmp/WAP5boot.img of=$KERNEL_PATH; done
		for KERNEL_PATH in $(ls -Rl /dev/block | grep -w $KERNEL_PARTITION | cut -d">" -f2 | cut -d" " -f2); do dd if=/tmp/WAP5boot.img of=$KERNEL_PATH; done
	done
fi
