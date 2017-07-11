# Compile Petalinux

All steps to configure openAMP for petalinux, described at the root of this repository, have been done already at this point. Just build Petalinux and create a SD Card to boot the image.

Setup Environment
```bash
source ../../../setup_environment.sh
```

Compile Petalinux and create bootable image
```shell
petalinux-build 
petalinux-package  --boot --fsbl $MZPL/os/project/mz_basic/components/plnx_workspace/fsbl/Release/fsbl.elf --fpga $MZPL/hw/mz_base/mz_base.runs/impl_1/system.bit --uboot --force
```

# Create SD Card and boot the image

```shell
sudo cp $MZPL/os/project/mz_basic/images/linux/image.ub $MZPL/os/project/mz_basic/images/linux/BOOT.BIN <location-to-sd-card>/boot -i
```

Test the openAMP application

```shell
echo matmul > /sys/class/remoteproc/remoteproc0/firmware
echo start > /sys/class/remoteproc/remoteproc0/state
modprobe rpmsg_user_dev_driver
```

```shell
linuxmatmul
```

```shell
modprobe -r rpmsg_user_dev_driver
echo stop > /sys/class/remoteproc/remoteproc0/state
