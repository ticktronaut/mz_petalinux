echo "Setup environment for mz_petalinux project."

MZPL="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PLPATH=$MZPL/os/setup
echo $PLPATH

echo "Set environment variable MZPL to project path:" 
echo $MZPL
if [ -f $PLPATH/settings.sh ]; then
  source $PLPATH/settings.sh
else
  echo "Warning: Petalinux-installation path variable not found. Is petalinux installed already?" 
  echo "- Change PLPATH variable of this script to correct petalinux path."
fi

source /opt/Xilinx/Vivado/2017.1/settings64.sh
source /opt/Xilinx/SDK/2017.1/settings64.sh
