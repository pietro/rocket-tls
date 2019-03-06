#!/bin/bash

set -eux -o pipefail

export TMPDIR="$HOME/tmp/repro-test"
mkdir -p "$TMPDIR"

reprotest -vv --variations=-all,build_path --source-pattern 'Cargo.* src/' '
    CARGO_HOME="$PWD/.cargo" RUSTUP_HOME='"$HOME/.rustup"' \
        RUSTFLAGS="--remap-path-prefix=$HOME=/remap-home --remap-path-prefix=$PWD=/remap-pwd" \
        cargo build -vv' \
          target/release/rocket_tls
