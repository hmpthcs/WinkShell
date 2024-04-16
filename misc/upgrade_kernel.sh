## DO NOT USE; WIP

#!/bin/sh

### Set some variables
repo_source="https://github.com/m-weigand/linux"
branch="branch_pinenote_6-6-25"

targetdir="/extlinux/***"
# use date for targetdir name
# sudo mkdir $targetdir

### Clone source
git clone --branch ${branch} --single-branch --depth 1 $repo_source

cd linux

### Make a pack folder inside the "linux" directory
test -d pack && rm -r pack
mkdir pack

### TODO: check for toolchain if attempting cross build; fetch if missing
if [[ $1 = ""cross"" ]]; then
  makeflags="ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu-"
else
  makeflags="ARCH=arm64"


### Build
make clean
make $makeflags pinenote_defconfig
make -j 4 $makeflags all

###***********
###?? do we need to do anything else here?
###***********

### Move stuff into "pack" folder
make $makeflags INSTALL_MOD_PATH=${PWD}/pack modules_install
# yields: pack/lib/modules/*

make $makeflags INSTALL_PATH=${PWD}/pack dtbs_install
# yields: pack/dtbs/*/rockchip/rk3566-pinenote-v1.2.dtb

# no: cp ./arch/arm64/boot/dtbs/rockchip/rk3566-pinenote-v1.2.dtb pack/
# Yes:
cp ./arch/arm64/boot/Image pack/
# yields: pack/Image

### Modules
#TODO: for cross/remote build
#cd pack
#tar cvzf modules.tar.gz lib
#rm -r lib
#cd ../..

### TODO: Move image, .dtb, modules to appropriate locations in pinenote filesystem

# Copy modules from pack/lib/modules/{kernel-version} to /lib/modules/{kernel-version} 
# If native build:
# (sudo):
cp -r pack/lib/modules/* /lib/modules/

# Copy Image from pack/Image to target
# (sudo):
cp pack/Image $targetdir

# Copy .dtb
# (sudo):
cp pack/dtbs/*/rockchip/rk3566-pinenote-v1.2.dtb $targetdir


#if [[ $1 = ""cross"" ]]; then
  ## Use ssh?
#else
  ## cp X -> Y, etc.  
###************

####
# finally, modify /boot/extlinux.conf to point to new Image and .dtb; can use same uInitrd.

