#!/bin/bash -eu
# Copyright 2019 Google Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
################################################################################

# build project
# e.g.
# ./autogen.sh
# ./configure
# make -j$(nproc) all

# build fuzzers
# e.g.
$CXX $CXXFLAGS  -std=c++11 -Iinclude \
	$SRC/first_fuzzer.cc -o $OUT/first_fuzzer-0 \
     $LIB_FUZZING_ENGINE 

clang++ -g -std=c++11 -stdlib=libc++ -fsanitize-address-use-after-scope -fsanitize=address,fuzzer  -Iinclude $SRC/first_fuzzer.cc -o $OUT/first_fuzzer-1 $LIB_FUZZING_ENGINE

clang++ -g -std=c++11 -stdlib=libc++ -fsanitize-address-use-after-scope -fsanitize=address -Iinclude $SRC/first_fuzzer.cc -o $OUT/first_fuzzer-2 $LIB_FUZZING_ENGINE

