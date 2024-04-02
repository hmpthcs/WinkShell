## DO NOT USE; WIP

#!/bin/sh

### Set some variables
repo_source="https://github.com/m-weigand/linux"
branch="branch_pinenote_6-6-22"


### Clone source
git clone $repo_source --branch $branch --single-branch --depth 1

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
make -j 2 $makeflags all

###***********
###?? do we need to do anything else here?
###***********

### Move stuff into "pack" folder
make $makeflags INSTALL_MOD_PATH=${PWD}/pack modules_install
make $makeflags INSTALL_PATH=${PWD}/pack dtbs_install
cp ./arch/arm64/boot/dts/rockchip/rk3566-pinenote-v1.2.dtb pack/
cp ./arch/arm64/boot/Image pack/

### Modules
cd pack
tar cvzf modules.tar.gz lib
rm -r lib
cd ../..

###************
### TODO: Move image, .dtb, modules to appropriate locations in pinenote filesystem
if [[ $1 = ""cross"" ]]; then
  ## Use ssh?
else
  ## cp X -> Y, etc.  
###************
