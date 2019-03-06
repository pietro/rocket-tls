#!/bin/bash

set -eux -o pipefail

reprotest -vv --vary=-time,-domain_host --source-pattern 'Cargo.* src/' '
    CARGO_HOME="$PWD/.cargo" RUSTUP_HOME='"$HOME/.rustup"' \
        RUSTFLAGS="--remap-path-prefix=$HOME=/remap-home --remap-path-prefix=$PWD=/remap-pwd" \
        cargo build --release -vv' \
          target/release/rocket_tls
