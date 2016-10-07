#!/bin/bash
# Copyright 2016 Google Inc. All Rights Reserved.
# Licensed under the Apache License, Version 2.0 (the "License");
set -x
. $(dirname $0)/../common.sh
rm -rf $CORPUS
mkdir $CORPUS
[ -e $EXECUTABLE_NAME_BASE ] && ./$EXECUTABLE_NAME_BASE -artifact_prefix=$CORPUS/ -max_len=512  -jobs=$JOBS -workers=$JOBS $CORPUS
grep 'Assertion `strcmp(openssl_results.exptmod, gcrypt_results.exptmod)==0. failed.' fuzz-0.log
