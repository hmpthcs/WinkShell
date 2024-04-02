###*****DO NOT USE: WIP*****
# Templated from https://github.com/m-weigand/u-boot-pinenote/.github/workflows/makefile.yml: 
#name: Build uboot image for the PineNote
#
#permissions:
#  contents: write
#
#on:
#  workflow_dispatch:
#
#
#jobs:
#  compile_uboot:
#    runs-on: ubuntu-latest
#    name: compile uboot for the PineNote
#    steps:
#      - name: Prepare environment
#        run: |
#          sudo apt-get update
#          sudo apt-get -y install build-essential crossbuild-essential-arm64 device-tree-compiler python3-pyelftools
#      - name: Checkout rkbin
#
#        # test -d rkbin || git clone --depth 1 --branch master https://github.com/rockchip-linux/rkbin.git
#        run: |
#          test -d rkbin || git clone --depth 1 --branch master https://github.com/m-weigand/rkbin.git
#          test -d u-boot-pinenote || git clone --branch branch_cyttsp5ub --depth 1 https://github.com/m-weigand/u-boot-pinenote
#          cd u-boot-pinenote
#          export CROSS_COMPILE=aarch64-linux-gnu-
#          make clean;
#          make rk3566-pinenote_defconfig;
#          ./make.sh
#          ./make.sh trust
#      - name: Upload files
#        uses: actions/upload-artifact@v3
#        with:
#          name: uboot-files
#          path: |
#            u-boot-pinenote/uboot.img
#            u-boot-pinenote/trust.img
#            u-boot-pinenote/idblock.bin
#
#  compile_uboot_cyttsp5_ram_1560mhz:
#    runs-on: ubuntu-latest
#    name: compile uboot for the PineNote, touch enabled, with 1560 MHz RAM blob
#    steps:
#      - name: Prepare environment
#        run: |
#          sudo apt-get update
#          sudo apt-get -y install build-essential crossbuild-essential-arm64 device-tree-compiler python3-pyelftools
#      - name: Checkout rkbin
#
#        # test -d rkbin || git clone --depth 1 --branch master https://github.com/rockchip-linux/rkbin.git
#        run: |
#          test -d rkbin || git clone --depth 1 --branch master https://github.com/m-weigand/rkbin.git
#          test -d u-boot-pinenote || git clone --branch branch_cyttsp5ub_1560mhz --depth 1 https://github.com/m-weigand/u-boot-pinenote
#          cd u-boot-pinenote
#          export CROSS_COMPILE=aarch64-linux-gnu-
#          make clean;
#          make rk3566-pinenote_defconfig;
#          ./make.sh
#          ./make.sh trust
#      - name: rename files
#        run: |
#            mv u-boot-pinenote/uboot.img u-boot-pinenote/uboot_1560mhz.img
#            mv u-boot-pinenote/trust.img u-boot-pinenote/trust_1560mhz.img
#            mv u-boot-pinenote/idblock.bin u-boot-pinenote/idblock_1560mhz.bin
#      - name: generate sha256 checksums
#        run: |
#            cd u-boot-pinenote
#            sha256sum uboot_1560mhz.img > ../sha256_uboot_1560mhz.img.txt
#            sha256sum trust_1560mhz.img > ../sha256_trust_1560mhz.img.txt
#            sha256sum idblock_1560mhz.bin > ../sha256_idblock_1560mhz.bin.txt
#
#      - name: Upload files
#        uses: actions/upload-artifact@v3
#        with:
#          name: uboot-files-cyttsp5_ram1560mhz
#          path: |
#            u-boot-pinenote/uboot_1560mhz.img
#            u-boot-pinenote/trust_1560mhz.img
#            u-boot-pinenote/idblock_1560mhz.bin
#            sha256_uboot_1560mhz.img.txt
#            sha256_trust_1560mhz.img.txt
#            sha256_idblock_1560mhz.bin.txt
#
#
#  generate_spl_boot_file:
#    runs-on: ubuntu-latest
#    name: Geneate rk356x_spl_loader_v1.12.112.bin
#    steps:
#      - name: Prepare environment
#        run: |
#          sudo apt-get update
#          sudo apt-get -y install build-essential crossbuild-essential-arm64 device-tree-compiler python3-pyelftools
#      - name: Checkout rkbin
#        run: |
#          test -d rkbin && rm -rf rkbin
#          git clone --shallow-since="2022-01-02T00:00:00Z" https://github.com/rockchip-linux/rkbin
#          cd rkbin
#          git checkout b6354b9
#          tools/boot_merger RKBOOT/RK3566MINIALL.ini
#      - name: Upload files
#        uses: actions/upload-artifact@v3
#        with:
#          name: rk356x_spl_loader_v1.12.112.bin
#          path: |
#            rkbin/rk356x_spl_loader_v1.12.112.bin
#
#  do_release:
#    # if: startsWith(github.ref, 'refs/tags/')
#    # if: contains(github.ref, "main")
#    runs-on: ubuntu-latest
#    needs:
#      - compile_uboot
#      - compile_uboot_cyttsp5_ram_1560mhz
#      - generate_spl_boot_file
#    steps:
#      - name: Clone workflow repository
#        uses: actions/checkout@v3
#      - name: Download image artifacts
#        uses: actions/download-artifact@v3
#       with:
#          path: artifacts/
#      - name: debug
#        run: |
#          ls artifacts/*/*
#      - name: Make release
#        uses: softprops/action-gh-release@v0.1.15
#        with:
#          draft: true
#          files: |
#            artifacts/rk356x_spl_loader_v1.12.112.bin/rk356x_spl_loader_v1.12.112.bin
#            artifacts/uboot-files/uboot.img
#            artifacts/uboot-files/trust.img
#            artifacts/uboot-files/idblock.bin
#            artifacts/uboot-files-cyttsp5_ram1560mhz/u-boot-pinenote/uboot_1560mhz.img
#            artifacts/uboot-files-cyttsp5_ram1560mhz/u-boot-pinenote/trust_1560mhz.img
#            artifacts/uboot-files-cyttsp5_ram1560mhz/u-boot-pinenote/idblock_1560mhz.bin
#            artifacts/uboot-files-cyttsp5_ram1560mhz/sha256_uboot_1560mhz.img.txt
#            artifacts/uboot-files-cyttsp5_ram1560mhz/sha256_trust_1560mhz.img.txt
#            artifacts/uboot-files-cyttsp5_ram1560mhz/sha256_idblock_1560mhz.bin.txt
#


#!/bin/sh

# Nothing yet (todo)
