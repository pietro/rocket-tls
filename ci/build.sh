#!/bin/bash

set -eux -o pipefail

case "$TARGET" in
    x86_64-unknown-linux-gnu)
        cc --version
        ;;
    *)
        mkdir .cargo

        cat > .cargo/config <<EOF
[target.$TARGET]
linker = "$TARGET_CC"
EOF

        cat .cargo/config

        "$TARGET_CC" --version
        ;;
esac

case "${BUILD_MODE-}" in
    reprotest)
        #docker build -t rocket_tls-reprotest -f ci/Dockerfile.reprotest .
        ;;
    *)
        cargo build -vv --target="$TARGET"
        ;;
esac
