#!/bin/bash
#
# Copyright 2016 Istio Authors. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
################################################################################
#

set -ex

# ensure correct path
mkdir -p $GOPATH/src/istio.io
mv $GOPATH/src/github.com/nlandolfi/proxy $GOPATH/src/istio.io
cd $GOPATH/src/istio.io/proxy/


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
