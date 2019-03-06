#!/bin/bash

set -eux -o pipefail

apt-get -qq update

case "$1" in
    x86_64-unknown-linux-gnu)
        ;;
    aarch64-unknown-linux-gnu)
        apt-get -qqy --no-install-recommends install \
                binfmt-support \
                gcc-aarch64-linux-gnu \
                libc6-dev-arm64-cross \
                qemu-user-binfmt
        ;;
    i686-unknown-linux-gnu)
        apt-get -qqy --no-install-recommends install gcc-multilib
        ;;
    arm-unknown-linux-gnueabihf)
        apt-get -qqy --no-install-recommends install \
                binfmt-support \
                gcc-arm-linux-gnueabihf \
                libc6-dev-armhf-cross \
                qemu-user-binfmt
        ;;
    armv7-unknown-linux-gnueabihf)
        apt-get -qqy --no-install-recommends install \
                binfmt-support \
                gcc-arm-linux-gnueabihf \
                libc6-dev-armhf-cross \
                qemu-user-binfmt
        ;;

    *)
        echo "UNKNOWN TARGET: $TARGET"
        exit 1
        ;;
esac

case "${BUILD_MODE-}" in
    reprotest)
        apt-get -qqy --no-install-recommends install diffoscope python3-pip
        pip3 install reprotest
        ;;
    *)
        ;;
esac
