# 1 "/home/usappz/bricks-project/platforms/microzed/mz_petalinux/os/project/mz_basic/build/../components/plnx_workspace/device-tree-generation/system-top.dts"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/home/usappz/bricks-project/platforms/microzed/mz_petalinux/os/project/mz_basic/build/../components/plnx_workspace/device-tree-generation/system-top.dts"







/dts-v1/;
/include/ "zynq-7000.dtsi"
/include/ "pcw.dtsi"
/ {
 chosen {
  bootargs = "earlycon";
  stdout-path = "serial0:115200n8";
 };
 aliases {
  ethernet0 = &gem0;
  serial0 = &uart1;
  serial1 = &uart0;
  spi0 = &qspi;
 };
 memory {
  device_type = "memory";
  reg = <0x0 0x40000000>;
 };
 cpus {
 };
};
# 1 "/home/usappz/bricks-project/platforms/microzed/mz_petalinux/os/project/mz_basic/build/tmp/work/plnx_arm-xilinx-linux-gnueabi/device-tree-generation/xilinx+gitAUTOINC+94fc615234-r0/system-user.dtsi" 1
/include/ "system-conf.dtsi"
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
# 29 "/home/usappz/bricks-project/platforms/microzed/mz_petalinux/os/project/mz_basic/build/../components/plnx_workspace/device-tree-generation/system-top.dts" 2
