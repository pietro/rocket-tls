#!/bin/bash

set -eux -o pipefail

case "${BUILD_MODE-}" in
    reprotest)
        #docker run --privileged rocket_tls-reprotest ci/reprotest.sh
        ci/reprotest.sh
        ;;
    *)
        cargo test -vv --target="$TARGET"
        ;;
esac
