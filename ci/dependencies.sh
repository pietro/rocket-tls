#!/bin/bash

set -eux -o pipefail

apt-get -q update

case "$1" in
    aarch64-unknown-linux-gnu)
        apt-get -qy install gcc-aarch64-linux-gnu
        ;;
    i686-unknown-linux-gnu)
        apt-get install -qy gcc-multilib
        ;;
    arm-unknown-linux-gnueabihf)
        apt-get install -qy gcc-arm-linux-gnueabihf
        ;;
    *)
        echo "UNKNOWN TARGET: $TARGET"
        exit 1
        ;;
esac
