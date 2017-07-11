mz\_petalinux
=============

mz\_petalinux repository is a guide on how to create a Base System for petalinux on the Microzed using petalinux, including support of openAMP. All code is developed on Vivado/SDK/Petalinux version 2017.1 on a Ubunto 14.04 host. Also the compilation of openAMP linux apps and remote applications is shown. 

* Create Petalinux boot image 
(including openAMP support and sample applications)
* Test openAMP sample applications
* Build remote and host applications in SDK

The project may be used as starting point for own developments. 

## Prerequiries

This guide expects following software to be installed:
* Xilinx Vivado SDK 2017.1
* git (sudo apt-get install git)

## Setup Environment

```shell
git clone https://github.com/ticktronaut/mz_petalinux.git
cd mz_petalinux
```

```shell
source setup_environment.sh
```

## Create Hardware

```shell
cd $MZPL/hw 
vivado -mode batch -source build.tcl
```
Open vivado
```shell
vivado $MZPL/hw/mz_base/mz_base.xpr
```
and do following the following (hopefully these steps can be done by tcl in the future):

In tcl console:
```
cd hw/mz_base

set PROJECT_NAME "mz_base"
set TOPLEVEL_NAME "system"
 
write_hwdef -force -file ./$PROJECT_NAME.runs/synth_1/$TOPLEVEL_NAME.hwdef
write_sysdef -force -hwdef ./$PROJECT_NAME.runs/synth_1/$TOPLEVEL_NAME.hwdef -bitfile ./$PROJECT_NAME.runs/impl_1/$TOPLEVEL_NAME.bit -file ./$PROJECT_NAME.runs/impl_1/$TOPLEVEL_NAME.sysdef
```
* *SIMULATION->Run Synthesis*
(If asked for top level module type *system*)
* *IMPLEMENTATION->Run Implementation*
* *PROGRAM AND DEBUG->Generate Bitstream*
* *File->Export->Export Hardware* (Check *Include bitstream* and click *OK*)


## Install Petalinux

Go to Xilinx website, download PetaLinux 2017.1 Installer (petalinux-v2017.1-final-installer.run) and make it executeable:
 
```shell
sudo chmod 755 petalinux-v2017.1-final-installer.run
```
Install petalinux to a directory of choice, in this case mz\_petalinux/os/setup
```shell
./petalinux-v2017.1-final-installer.run $MZPL/os/setup
``` 

```shell
source $MZPL/os/setup/settings.sh
```

## Patch Petalinux

If host platform is Ubuntu 14.04 (and maybe also other platforms), it might be necessary to patch the installation of Petalinux. The problem is that the command `petalinxu -c kernel` fails to open menuconfig and arouses an error concerning the gnome terminal:
```
"Failed to execute child process "oe-gnome-terminal-phonehome" (No such file or directory)" 
```
If the command `petalinux -c kernel` shows this behavier in [patchwork.openembedded](https://patchwork.openembedded.org/patch/129527) following patch is proposed:
Open the file *terminal.py* by an editor of your choice. In this case vi is used:
```bash
sudo vi $MZPL/os/setup/components/yocto/source/arm/layers/core/meta/lib/oe/terminal.py
```
Replace the following line
```
            sh_cmd = "oe-gnome-terminal-phonehome " + pidfile + " " + sh_cmd
```
by this code
```
            #sh_cmd = "oe-gnome-terminal-phonehome " + pidfile + " " + sh_cmd
            sh_cmd = bb.utils.which(os.getenv('PATH'), "oe-gnome-terminal-phonehome") + " " + pidfile + " " + sh_cmd
```
Since *terminal.py* is a Python script, make sure to preserve the number of preceeding spaces of these lines of code.

<!--
```python
diff --git a/meta/lib/oe/terminal.py b/meta/lib/oe/terminal.py
index 3901ad3..5c3e0aa 100644
--- a/meta/lib/oe/terminal.py
+++ b/meta/lib/oe/terminal.py
@@ -67,7 +67,7 @@  class Gnome(XTerminal):
         import tempfile
         pidfile = tempfile.NamedTemporaryFile(delete = False).name
         try:
-            sh_cmd = "oe-gnome-terminal-phonehome " + pidfile + " " + sh_cmd
+            sh_cmd = bb.utils.which(os.getenv('PATH'), "oe-gnome-terminal-phonehome") + " " + pidfile + " " + sh_cmd
             XTerminal.__init__(self, sh_cmd, title, env, d)
             while os.stat(pidfile).st_size <= 0:
                 continue
```
-->

## Create boot image

```bash
source $MZPL/setup_environment.sh
```

```bash
cd $MZPL/os/project
```

```bash
petalinux-create --type project --template zynq --name mz_basic
cd mz_basic
```

```bash
petalinux-config --get-hw-description=$MZPL/hw/mz_base/mz_base.sdk -v
```

Following configs are done in reference to [*UG1186 (v2017.1)*](http://www.xilinx.com/support/documentation/sw_manuals/xilinx2017_1/ug1186-zynq-openamp-gsg.pdf):
```
  Subsystem AUTO Hardware Settings --->
    Memory Settings --->
      (0x10000000) kernel base address
```
```
  u-boot Configuration --->
    (0x11000000) netboot offset
```

```bash
petalinux-config -c kernel
```
```
[*] Enable loadable module support --->
```

```
Device Drivers --->
  Generic Driver Options --->
    <*> Userspace firmware loading support
```

```
Device Drivers --->
    Remoteproc drivers --->
  # for R5:
  <M> ZynqMP_r5 remoteproc support
  # for Zynq A9
  <M> Support ZYNQ remoteproc 
```

```
Kernel Features--->
  Memory split (...)--->
  (x) 2G/2G user/kernel split
```

```
Kernel Features--->
  [*] High Memory Support--->
```

```
petalinux-config -c rootfs
```

```
Filesystem Packages --->
  misc --->
    packagegroup-petalinux-openamp ---> 
      [*] packagegroup-petalinux-openamp
      [*] packagegroup-petalinux-openamp-dbg
      [*] packagegroup-petalinux-openamp-dev
```

```
Filesystem Packages --->
  misc --->
    openamp-fw-echo-testd --->
      [*] openamp-fw-echo-testd
    openamp-fw-mat-muld --->
      [*] openamp-fw-mat-muld
    openamp-fw-rpc-demo --->
      [*] openamp-fw-rpc-demo
```

```shell
vi project-spec/meta-user/recipes-bsp/device-tree/files/system-user.dtsi
```

With following content

```
/ {
  amba {
    elf_ddr_0: ddr@0 {
      compatible = "mmio-sram";
      reg = <0x100000 0x100000>;
    };

  };

  remoteproc0: remoteproc@0 {
    compatible = "xlnx,zynq_remoteproc";
    firmware = "firmware";
    vring0 = <15>;
    vring1 = <14>;
    sram_0 = <&elf_ddr_0>;

  };
};
```

```shell
petalinux-build
```

```shell
petalinux-package  --boot --fsbl $MZPL/os/project/mz_basic/components/plnx_workspace/fsbl/Release/fsbl.elf --fpga $MZPL/hw/mz_base/mz_base.runs/impl_1/system.bit --uboot
```
Repeated call requires this command to be exceeded by adding a --force tag.


```shell
sudo cp $MZPL/os/project/mz_basic/images/linux/image.ub $MZPL/os/project/mz_basic/images/linux/BOOT.BIN <location-to-sd-card>/boot -i
```

## Boot image and run Example Applications

```shell
cat /proc/cpuinfo 
```

### Running the Echo Test

```shell
echo image_echo_test > /sys/class/remoteproc/remoteproc0/firmware
echo start > /sys/class/remoteproc/remoteproc0/state
modprobe rpmsg_user_dev_driver
```

```shell
echo_test
```

```shell
modprobe -r rpmsg_user_dev_driver
echo stop > /sys/class/remoteproc/remoteproc0/state
```

### Running the Matrix Multiplication Test

```shell
echo image_matrix_multiply > /sys/class/remoteproc/remoteproc0/firmware
echo start > /sys/class/remoteproc/remoteproc0/state
modprobe rpmsg_user_dev_driver
```

```shell
mat_mul_demo
```

```shell
modprobe -r rpmsg_user_dev_driver
echo stop > /sys/class/remoteproc/remoteproc0/state
```

### Running the Proxy Application

```shell
proxy_app
```

### Manually Create and build remote OpenAMP sample applications 

Launch Xilinx SDK
```shell
cd $MZPL/sw
source $MZPL/setup_environment.sh
xsdk
```

1. Choose a workspace
2. Create Hardware Platform Specification

    a. File->New->Project->Xilinx->Hardware Platform Specification
    
    b. **Next**

    c. Choose a name: `hw_mz_base`

    d. Choose the Target Hardware Specification `hw/mz_base/mz_base.sdk/system.hdf`

    e. **Finish**

3. Manually create and build openAMP remote sample applications
 
    a. Specify the BSP os platform

      * `standalone` for a bare-metal application.
      * `freertos` for a FreeRTOS application.

    b. Specify the hardware platform (`hw_mz_base`)
    c. Select the processor: `ps7_cortexa9_1`

    d. Select Board Support Package
      * **Use Existing** if you had previously created an application with a BSP and want to re-use same BSP.
      * **Create New BSP** to create a new BSP. Choose the name `open_amp_freertos_bsp`
   
    e. Click **Next** to selct a template available (do *not* click **Finish**)

    f. Select one the three application templates available for OpenAMP remote bare-metal from the available templates:
      * OpenAMP echo-test
      * OpenAMP matrix multiplication test
      * OpenAMP RPC Demo    
  
    g. Click **Finish**. 

4. Make Board Support Package ready for openAMP

    a. In the SDK project explorer, right-click the BSP and select **Board Support Package Settings**.

    b. Navigate to the **BSP Settings > Overview > OpenAMP.

    c. Set the WITH_PROXY parameter as follows:

      * For the OpenAMP RPC demonstration, set the parameter to *true* (default).          
      * For other demo applications, set the parameter to *false*

    d. Navigate to the BSP settings drivers: **Settings > Overview > Drivers > ps7_cortexa9_1**.
      * To disable initialization of shared resources when the master processor is handling shared resources initialization, add to *extra_compiler_flags*: `-DUSE_AMP=1`

    e. Click **OK** button.

5. Integrate binaries to your petalinux-installation 

    ```shell
    cd $MZPL/os/project/mz_basic
    ```

    ```shell
    petalinux-create -t apps --template install -n matmul --enable
    ```

    ```shell
    vi project-spec/meta-user/recipes-apps/matmul/matmul.bb 
   ```

    ```
    SUMMARY = "Simple test application"
    SECTION = "PETALINUX/apps"
    LICENSE = "MIT"
    LIC_FILES_CHKSUM =
    "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

    SRC_URI = "file://matmul"
    S = "${WORKDIR}"
    INSANE_SKIP_${PN} = "arch"

    do_install() {
    install -d ${D}/lib/firmware
    install -m 0644 ${S}/matmul ${D}/lib/firmware/matmul
    }
  
    FILES_${PN} = "/lib/firmware/matmul"
    ```

    ```shell
    cp $MZPL/sw/matrix_multiplication_demo_custom/Debug/matrix_multiplication_demo_custom.elf $MZPL/os/project/mz_basic/project-spec/meta-user/recipes-apps/matmul/files/matmul -i
    ```

    ```shell
    petalinux-build 
    petalinux-package  --boot --fsbl $MZPL/os/project/mz_basic/components/plnx_workspace/fsbl/Release/fsbl.elf --fpga $MZPL/hw/mz_base/mz_base.runs/impl_1/system.bit --uboot --force
    ``` 
### Manually create and build OpenAMP linux sample applications 

```shell
cd $MZPL/sw
source $MZPL/setup_environment.sh
xsdk
```

1. Choose a workspace
2. Create Hardware Platform Specification

    a. File > New > Project > Application Project 

    b. Choose a name: `matrix_multiplication_demo_linux_app` 

    c. OS Platform: **Linux** 
    
    d. Leave *Linux Root* and *Linux Toolchain* unchecked. 
   
    e. **Next**

    f. Choose **Linux Empty Application**

    e. **Finish**

3. Create C-File 

    a. Expand the created application *matrix_multiplication_demo_linux_app*

    b. Right Click *src*

    c. New > Source File

    d. Name it `linuxmatmul.c`

    e. **Finish**

4. Copy the content of a sample application to the source file `linuxmatmul.c`

    Boot the image, that has been created before and copy the content of `mat_mul_demo.c` to the code of the linux application project `linuxmatmul.c`.

      ```shell
      cat /usr/src/debug/rpmsg-mat-mul/1.0-r0/mat_mul_demo.c
      ```

5. Add the Linux app to the Kernel 
      
      ```shell
      cd $PLMZ/os/project/mz_base
      ```

      ```shell
      petalinux-create -t apps --template install -n linuxmatmul --enable
      ```

      ```shell
      cp $MZPL/sw/matrix_multiplication_demo_linux_app/Debug/matrix_multiplication_demo_linux_app.elf $MZPL/os/project/mz_basic/project-spec/meta-user/recipes-apps/linuxmatmul/files/linuxmatmul -i
      ```

      ```shell
      petalinux-build 
      petalinux-package  --boot --fsbl $MZPL/os/project/mz_basic/components/plnx_workspace/fsbl/Release/fsbl.elf --fpga $MZPL/hw/mz_base/mz_base.runs/impl_1/system.bit --uboot --force
      ```

### Again create SD Card and boot the image

Boot the image

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
```

## Ethernet

Device Tree example according to ug1144 (v2017.1):

```shell
&gem0 {
phy-handle = <&phy0>
ps7_ethernet_0_mdio: mdio {
phy0: phy@7 {
compatible = "marvel.88e1116r";
device_type = "ethernet-phy";
reg = <7>;
};
};
};
```
