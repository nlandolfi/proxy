# Copyright 2016 Google Inc. All Rights Reserved.
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
package(default_visibility = ["//contrib/endpoints/src/api_manager:__subpackages__"])

cc_library(
    name = "auth",
    srcs = [
        "jwt_cache.cc",
    ],
    hdrs = [
        "certs.h",
        "jwt_cache.h",
    ],
    linkopts = select({
        "//:darwin": [],
        "//conditions:default": [
            "-lm",
            "-luuid",
        ],
    }),
    deps = [
        "//contrib/endpoints/src/api_manager:auth_headers",
        "//contrib/endpoints/src/api_manager/auth/lib",
        "//contrib/endpoints/src/api_manager/utils",
        "//external:googletest_prod",
        "//external:servicecontrol_client",
    ],
)

cc_library(
    name = "service_account_token",
    srcs = [
        "service_account_token.cc",
    ],
    hdrs = [
        "service_account_token.h",
    ],
    linkopts = select({
        "//:darwin": [],
        "//conditions:default": [
            "-lm",
            "-luuid",
        ],
    }),
    deps = [
        "//contrib/endpoints/include:headers_only",
        "//contrib/endpoints/src/api_manager/auth/lib",
        "//contrib/endpoints/src/api_manager/utils",
        "//external:grpc++",
    ],
)

cc_test(
    name = "jwt_cache_test",
    size = "small",
    srcs = [
        "jwt_cache_test.cc",
    ],
    linkstatic = 1,
    deps = [
        ":auth",
        "//external:googletest_main",
    ],
)

cc_test(
    name = "service_account_token_test",
    size = "small",
    srcs = [
        "service_account_token_test.cc",
    ],
    linkstatic = 1,
    deps = [
        ":service_account_token",
        "//contrib/endpoints/src/api_manager:mock_api_manager_environment",
        "//external:googletest_main",
    ],
)
