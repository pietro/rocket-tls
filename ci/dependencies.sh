#!/bin/bash

set -eux -o pipefail

apt-get -qq update

case "$1" in
    x86_64-unknown-linux-gnu)
        ;;
    aarch64-unknown-linux-gnu)
        apt-get -qqy --no-install-recommends install gcc-aarch64-linux-gnu
        ;;
    i686-unknown-linux-gnu)
        apt-get -qqy --no-install-recommends install gcc-multilib
        ;;
    arm-unknown-linux-gnueabihf)
        apt-get -qqy --no-install-recommends install gcc-arm-linux-gnueabihf
        ;;
    *)
        echo "UNKNOWN TARGET: $TARGET"
        exit 1
        ;;
esac
