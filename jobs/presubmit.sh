#!/bin/bash

set -e

# present working directory is the root of the repo
# echo "present working dir: ${cat pwd}"

echo "=== Code Check ==="

echo ">> Running ./script/check-license-headers"
./script/check-license-headers
echo ">> Running ./script/check-style"
./script/check-style

echo ">> Running bazel fetch -k //..."
bazel fetch -k //...

echo "=== Bazel Build ==="

echo ">> Running bazel build"
bazel build //...

echo "=== Bazel Test ==="

echo ">> Running bazel test"
bazel test //...

echo "=== Push Test Binary ==="

echo ">> Running ./script/release-binary"
./script/release-binary
