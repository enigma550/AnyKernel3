### AnyKernel3 Ramdisk Mod Script
## osm0sis @ xda-developers

### AnyKernel setup
# begin properties
properties() { '
kernel.string=Larry Kernel (LOS 22.2) for OnePlus Nord CE 3 Lite 5G (KSUN) by Enigma550
do.devicecheck=1
do.modules=0
do.systemless=0
do.cleanup=1
do.cleanuponabort=0
support.versions=15,22.2
device.name1=larry
device.name2=OP5958L1
'; } # end properties


### AnyKernel install
## boot shell variables
block=boot;
is_slot_device=auto;
ramdisk_compression=auto;
patch_vbmeta_flag=auto;
no_magisk_check=1;

# import functions/variables and setup patching - see for reference (DO NOT REMOVE)
. tools/ak3-core.sh


ui_print " "
ui_print "-> Checking kernel compatibility..."

if cat /proc/version | grep "Linux version 5.4" | grep -q "qgki"; then
  ui_print "-> Check passed. KSUN supported."
else
  abort "-> Error: Target must be a 5.4 QGKI kernel."
fi

# boot install
ui_print "-> Dumping boot."
dump_boot;
ui_print "-> Writing boot."
write_boot;
